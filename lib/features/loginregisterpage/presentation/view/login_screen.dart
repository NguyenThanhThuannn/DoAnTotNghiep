import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/end_points.dart';
import '../../../../widgets/onboarding_screen.dart';
import '../../../homepage/presentation/view/home_page_screen.dart';
import '../../data/services/provider.dart';
import '../../domain/entities/user.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/user_bloc.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  bool isHidden = true;
  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      'Welcome',
                      style: textStyleMontserratBold36,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 25),
                    child: TextField(
                      controller: txt1,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Username or Email',
                        hintStyle: textStyleMontserratMedium14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 25),
                    child: TextField(
                      controller: txt2,
                      obscureText: isHidden,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        hintStyle: textStyleMontserratMedium14,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: isHidden
                              ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  /* GestureDetector(
                    onTap: () {
                      print('clicked QMK');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Quên mật khẩu?',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ), */
                  BlocConsumer<AuthBloc, AuthState>(
                    builder: (final context, final state) {
                      if (state is AuthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        margin: const EdgeInsets.only(top: 25),
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 4.5,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).primaryColor,
                            ),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              context
                                  .read<AuthBloc>()
                                  .add(LoginEvent(txt1.text, txt2.text));
                              //AuthService().login(txt1.text, txt2.text);
                            });
                          },
                          child: Text(
                            'Login',
                            style: textStyleMontserratSemiBold20,
                          ),
                        ),
                      );
                    },
                    listener: (final context, final state) {
                      if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Success')),
                        );
                        final User? user = state.user;
                        Provider.of<UserProvider>(context, listen: false)
                            .setUser(user);
                        // Gửi sự kiện GetUserById đến UserBloc
                        context.read<UserBloc>().add(GetUserById(
                            Provider.of<UserProvider>(context, listen: false)
                                .getUser!
                                .id!,),);
                        log('User được set với ID là: ${Provider.of<UserProvider>(context, listen: false).getUser!.id!}');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (final context) => const HomePageScreen(),
                          ),
                          (final route) => false,
                        );
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 35.0),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width / 3.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Text(
                          '- OR Continue with -',
                          style: textStyleMontserratMedium14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.abc),
                            ),
                            IconButton(
                              style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.abc),
                            ),
                            IconButton(
                              style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.abc),
                            ),
                          ],
                        ), */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Create an account '),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (final context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(
    final String email,
    final String password,
  ) async {
    try {
      final Response response = await _dio.post(
        '${EndPoints.baseUrl}login',
        data: {
          'email': email,
          'password': password,
        },
      );
      log('DN:${response.data}');
      return response.data;
    } catch (error) {
      print('Login error: $error');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> register(
    final String email,
    final String password,
  ) async {
    try {
      final Response response = await _dio.post(
        '${EndPoints.baseUrl}signup',
      );
      log(response.data.toString());
      return response.data;
    } catch (error) {
      print('Login error: $error');
      rethrow; // Handle error appropriately in your app
    }
  }
}

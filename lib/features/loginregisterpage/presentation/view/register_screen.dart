import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../bloc/auth_bloc.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool isHiddenPW = true;
  bool isHiddenCPW = true;
  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusScope.of(context).unfocus();
        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    'Create an account',
                    style: textStyleMontserratBold36,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 25),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Name',
                      hintStyle: textStyleMontserratMedium14,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 25),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Email',
                      hintStyle: textStyleMontserratMedium14,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 25),
                  child: TextField(
                    controller: passwordController,
                    obscureText: isHiddenPW,
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
                            isHiddenPW = !isHiddenPW;
                          });
                        },
                        child: isHiddenPW
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 25),
                  child: TextField(
                    controller: confirmpasswordController,
                    obscureText: isHiddenCPW,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'ConfirmPassword',
                      hintStyle: textStyleMontserratMedium14,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHiddenCPW = !isHiddenCPW;
                          });
                        },
                        child: isHiddenCPW
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Text.rich(
                    TextSpan(
                      text: 'By clicking the ',
                      style: textStyleMontserratRegular14,
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.red
                                    : const Color.fromARGB(255, 234, 184, 89),
                          ),
                        ),
                        TextSpan(
                            text: ' button, you agree to the public offer',
                            style: textStyleMontserratRegular14,),
                      ],
                    ),
                  ),
                ),
                BlocConsumer<AuthBloc,AuthState>(
                  builder: (final context, final state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
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
                            if(validatePassword(passwordController.text, confirmpasswordController.text)){
                              context.read<AuthBloc>().add(SignupEvent(nameController.text, emailController.text, passwordController.text,confirmpasswordController.text));
                            }
                          });
                        },
                        child: Text(
                          'Create an account',
                          style: textStyleMontserratSemiBold20,
                        ),
                      ),
                    );
                  },
                  listener: (final context, final state) {
                    if (state is RegisterFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                    if (state is RegisterSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Register Success')),
                      );
                      log('Email đăng ký:${state.user!}');
                      Navigator.pop(context);
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
                          const Text('I already have an account '),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (final context) =>
                                          const LoginScreen(),
                                    ),);
                              });
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor,
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
    );
  }
}
bool validatePassword(final String password, final String confirmPassword) {
  // Kiểm tra mật khẩu và mật khẩu xác nhận có giống nhau không
  if (password != confirmPassword) {
    print('Password và Confirm Password không giống nhau');
    return false;
  }

  // Kiểm tra độ dài tối thiểu của mật khẩu
  if (password.length < 8) {
    print('Mật khẩu phải có ít nhất 8 ký tự');
    return false;
  }

  // Kiểm tra có ít nhất một chữ thường
  if (!password.contains(RegExp('[a-z]'))) {
    print('Mật khẩu phải có ít nhất một chữ thường');
    return false;
  }

  // Kiểm tra có ít nhất một chữ hoa
  if (!password.contains(RegExp('[A-Z]'))) {
    print('Mật khẩu phải có ít nhất một chữ hoa');
    return false;
  }

  // Kiểm tra có ít nhất một chữ số
  if (!password.contains(RegExp('[0-9]'))) {
    print('Mật khẩu phải có ít nhất một chữ số');
    return false;
  }

  // Kiểm tra có ít nhất một ký tự đặc biệt
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    print('Mật khẩu phải có ít nhất một ký tự đặc biệt');
    return false;
  }

  // Nếu tất cả các kiểm tra đều qua
  print('Mật khẩu hợp lệ');
  return true;
}
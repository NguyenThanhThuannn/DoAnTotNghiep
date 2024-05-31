import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../../widgets/onboarding_screen.dart';
import '../../../homepage/presentation/view/home_page_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  bool isHidden = false;
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
                      'Chào mừng trở lại',
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
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.abc),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
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
                  ),
                  Container(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (final context) =>
                                  const HomePageScreen(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Đăng nhập',
                        style: textStyleMontserratSemiBold20,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 35.0),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width / 3.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Tạo một tài khoản '),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  print('clicked ĐK');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (final context) =>
                                            const RegisterScreen(),
                                      ));
                                });
                              },
                              child: Text(
                                'Đăng ký',
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

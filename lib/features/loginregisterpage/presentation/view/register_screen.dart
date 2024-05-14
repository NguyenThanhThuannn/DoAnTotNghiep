import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  bool isHiddenPW = false;
  bool isHiddenCPW = false;
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
                    'Tạo một tài khoản',
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
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.abc),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 25),
                  child: TextField(
                    controller: txt3,
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
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.abc),
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
                            color: Theme.of(context).brightness == Brightness.light? Colors.red:const Color.fromARGB(255, 234, 184, 89),
                          ),
                        ),
                        TextSpan(text: ' button, you agree to the public offer',style: textStyleMontserratRegular14),
                      ],
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
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),),),
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor,),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
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
                      'Tạo tài khoản',
                      style: textStyleMontserratSemiBold20,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35.0),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width/3.5,
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
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: Theme.of(context).primaryColor,),),),
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                          IconButton(
                            style: ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: Theme.of(context).primaryColor,),),),
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                          IconButton(
                            style: ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: Theme.of(context).primaryColor,),),),
                            onPressed: () {},
                            icon: const Icon(Icons.abc),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Tôi đã có tài khoản '),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                print('clicked ĐK');
                                Navigator.push(context, MaterialPageRoute(builder: (final context) => const LoginScreen(),));
                              });
                            },
                            child: Text('Đăng nhập',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Theme.of(context).primaryColor,
                                ),),
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../config/textStyle.dart';
import '../features/homepage/presentation/view/home_page_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/onboarding.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 50,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Khám phá nhiều loại sản phẩm khác nhau',
                      style: textStylePlusJakartaSansBold24,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Khám phá một loạt các sản phẩm trong tầm tay của bạn. Chúng tôi cung cấp một bộ sưu tập phong phú phù hợp với nhu cầu của bạn.',
                      softWrap: true,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: textStylePlusJakartaSansRegular14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (final context) => const HomePageScreen(),
                            ),);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.width/8,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Color.fromRGBO(0, 138, 238, 0.85),
                            Color.fromRGBO(124, 200, 255, 1),
                          ],
                        ),
                      ),
                      child: Text('Bắt đầu',style: textStyleInterMedium20W,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

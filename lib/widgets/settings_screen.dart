import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/textStyle.dart';
import '../features/faqpage/presentation/view/faq_screen.dart';
import '../features/loginregisterpage/presentation/view/login_screen.dart';
import '../features/policypage/presentation/view/policy_screen.dart';
import '../features/termpage/presentation/view/term_screen.dart';
import '../features/themechange/bloc/theme_bloc.dart';
import '../features/themechange/data/theme.dart';
import '../features/themechange/domain/themeEntity.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: const ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(150, 100),
                      bottomRight: Radius.elliptical(150, 100),
                    ),
                  ),
                ),
                child: Container(
                  width: size.width,
                  height: size.width / 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade400,
                        Colors.grey.shade600,
                        Colors.grey.shade800,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 15,
                child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.navigate_before_outlined),),),
              Positioned(
                top: 50,
                left: 140,
                child: CircleAvatar(
                  minRadius: 70,
                  maxRadius: 70,
                  //backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/img/gear.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: 230,
                child: Container(
                  width: size.width / 7,
                  height: size.width / 7,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (final context) {
                          return const AlertDialog.adaptive(
                            title: Text('TEST'),
                            content: Text('CONTENT'),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 130,
                child: Text(
                  'John Aderson',
                  style: textStyleInterExtraBold24W,
                ),
              ),
            ],
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (final context, final state) {
              final isLightTheme = state.theme.themeData == darkTheme;
              return SwitchListTile.adaptive(
                title: Text(
                  'DarkMode',
                  style: textStyleAnybodyRegular18,
                ),
                value: isLightTheme,
                onChanged: (final value) {
                  final newTheme =
                      value ? ThemeEntity(darkTheme) : ThemeEntity(lightTheme);
                  context.read<ThemeBloc>().add(ChangeTheme(newTheme));
                },
              );
            },
          ),
          const Spacer(),
          ListTile(
            leading: Icon(
              Icons.question_mark_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Câu hỏi thường gặp',
              style: textStyleInterRegular16,
            ),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const FAQScreen(),
                    ),);
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.policy_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Chính sách bảo mật',
              style: textStyleInterRegular16,
            ),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const PolicyScreen(),
                    ),);
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.confirmation_number_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'Điều khoản và điều kiện',
              style: textStyleInterRegular16,
            ),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) => const TermScreen(),
                    ),);
              });
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: size.width,
            height: size.width / 7,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor:
                    MaterialStatePropertyAll(Theme.of(context).primaryColor),
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),),),
              ),
              onPressed: () async{
                showDialog(
                  context: context,
                  builder: (final context) {
                    return AlertDialog.adaptive(
                      title: const Text('Bạn muốn đăng xuất?'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (final context) =>
                                      const LoginScreen(),
                                ),),
                            child: const Text('OK'),),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Đăng Xuất',
                style: textStyleInterSemiBold16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

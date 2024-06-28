import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../config/textStyle.dart';
import '../features/changepasswordpage/presentation/view/change_oldpw_screen.dart';
import '../features/faqpage/presentation/view/faq_screen.dart';
import '../features/loginregisterpage/data/services/provider.dart';
import '../features/loginregisterpage/domain/entities/user.dart';
import '../features/loginregisterpage/presentation/bloc/user_bloc.dart';
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
  bool isEditing = false;
  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (final context, final state) {
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is UserError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        if (state is UserLoaded) {
          final TextEditingController usernameController =TextEditingController(text: state.user!.name);
          final TextEditingController phoneController =TextEditingController(text: state.user!.phone_number);
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: const ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(90, 50),
                            bottomRight: Radius.elliptical(90, 50),
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
                        child: const Icon(Icons.navigate_before_outlined),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 130,
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
                      left: 220,
                      child: Container(
                        width: size.width / 7,
                        height: size.width / 7,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 4),
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showAdaptiveDialog(
                              context: context,
                              builder: (final context) {
                                return StatefulBuilder(
                                  builder: (final context, final setState) => 
                                  AlertDialog.adaptive(
                                    title: const Text('Thông tin tài khoản:'),
                                    content: Container(
                                      width: size.width,
                                      height: size.width / 2,
                                      color: Colors.green,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              if (isEditing) Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Username: '),
                                                    TextField(controller: usernameController,),
                                                    const Text('Phone: '),
                                                    TextField(controller: phoneController,),
                                                  ],
                                                ),
                                              ) else Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Username: ${state.user!.name}'),
                                                  Text(
                                                    'Email: ${state.user!.email!}',
                                                  ),
                                                  Text(
                                                    'Phone: ${state.user!.phone_number}',
                                                  ),
                                                  const Text('Địa chỉ: '),
                                                  Container(
                                                    color: Colors.red,
                                                    width: size.width / 1.5,
                                                    height: size.width / 8 +
                                                        (state.user!.addresses!
                                                            .length),
                                                    child: ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount: state.user!
                                                          .addresses!.length,
                                                      itemBuilder: (
                                                        final context,
                                                        final index,
                                                      ) {
                                                        return Text(
                                                          '${state.user!.addresses![index].id} ${state.user!.addresses![index].address_line!} ${state.user!.addresses![index].city}',
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isEditing=!isEditing;
                                                  });
                                                },
                                                child: const Text('Sửa'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Hủy'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                      left: 100,
                      child: Text(
                        state.user!.name!.toUpperCase(),
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
                        final newTheme = value
                            ? ThemeEntity(darkTheme)
                            : ThemeEntity(lightTheme);
                        context.read<ThemeBloc>().add(ChangeTheme(newTheme));
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Thay đổi mật khẩu',
                    style: textStyleInterRegular16,
                  ),
                  trailing: const Icon(Icons.navigate_next_outlined),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (final context) =>
                              const ChangeOldPasswordScreen(),
                        ),
                      );
                    });
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
                        ),
                      );
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
                        ),
                      );
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
                        ),
                      );
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  height: size.width / 7,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    onPressed: () async {
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
                                  ),
                                ),
                                child: const Text('OK'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
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
        return const SizedBox();
      },
    );
  }
}

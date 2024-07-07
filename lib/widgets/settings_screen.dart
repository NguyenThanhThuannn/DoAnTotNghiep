import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../config/constaint.dart';
import '../config/textStyle.dart';
import '../features/changepasswordpage/presentation/view/change_oldpw_screen.dart';
import '../features/faqpage/presentation/view/faq_screen.dart';
import '../features/loginregisterpage/data/model/user_model.dart';
import '../features/loginregisterpage/data/services/provider.dart';
import '../features/loginregisterpage/domain/entities/user.dart';
import '../features/loginregisterpage/presentation/bloc/user_bloc.dart';
import '../features/loginregisterpage/presentation/view/login_screen.dart';
import '../features/orderpage/presentation/view/order_screen.dart';
import '../features/policypage/presentation/view/policy_screen.dart';
import '../features/termpage/presentation/view/term_screen.dart';
import '../features/themechange/bloc/theme_bloc.dart';
import '../features/themechange/data/theme.dart';
import '../features/themechange/domain/themeEntity.dart';
import '../network/end_points.dart';
import 'addressUser_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isEditing = false;
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(
          GetUserById(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        );
  }

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
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
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
                          maxRadius: 70,
                          minRadius: 70,
                          child: CachedNetworkImage(
                            imageUrl: state.user!.user_image ?? '',
                            imageBuilder: (final context, final imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            progressIndicatorBuilder:
                                (final context, final url, final progress) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.08),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                ),
                              );
                            },
                            errorWidget:
                                (final context, final url, final error) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  color: Colors.black.withOpacity(0.04),
                                ),
                              );
                            },
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (final context) =>
                                      EditInformationUserScreen(
                                    user: state.user!,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            state.user!.name!.toUpperCase(),
                            style: textStyleInterExtraBold24W,
                          ),
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
                    title: Text(
                      'Địa chỉ',
                      style: textStyleInterRegular16,
                    ),
                    trailing: const Icon(Icons.navigate_next_outlined),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (final context) =>
                                const AddressesUserScreen(),
                          ),
                        );
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Lịch sử đơn hàng',
                      style: textStyleInterRegular16,
                    ),
                    trailing: const Icon(Icons.navigate_next_outlined),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (final context) => const OrderScreen(),
                          ),
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
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
                ],
              ),
            ),
            bottomSheet: Container(
              margin: const EdgeInsets.all(10),
              width: size.width,
              height: size.width / 7,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
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
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (final context) =>
                                      const LoginScreen(),
                                ),
                                (final route) => false,
                              );
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).setUser(null);

                              log(
                                Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).getUser.toString(),
                              );
                            },
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
          );
        }
        return const SizedBox();
      },
    );
  }
}

class EditInformationUserScreen extends StatefulWidget {
  EditInformationUserScreen({super.key, required this.user});
  User user;

  @override
  State<EditInformationUserScreen> createState() =>
      _EditInformationUserScreenState();
}

class _EditInformationUserScreenState extends State<EditInformationUserScreen> {
  File? image;

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future _pickImage(final ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<ImageSource?> showImageSource(final BuildContext context) async {
    showBottomSheet(
      context: context,
      builder: (final context) {
        return Column(
          children: [
            ListTile(
              title: const Text('Camera'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        );
      },
    );
    return null;
  }

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.user.name);
    phoneController = TextEditingController(text: widget.user.phone_number);
    emailController = TextEditingController(text: widget.user.email);
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        title: Text(
          'Thông tin tài khoản người dùng',
          style: textStylePlusJakartaSansMedium14Height1point5,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 70,
                minRadius: 70,
                child: image == null
                    ? CachedNetworkImage(
                        imageUrl: widget.user.user_image!??'',
                        imageBuilder: (final context, final imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        progressIndicatorBuilder:
                            (final context, final url, final progress) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.08),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: const CupertinoActivityIndicator(),
                            ),
                          );
                        },
                        errorWidget: (final context, final url, final error) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              color: Colors.black.withOpacity(0.04),
                            ),
                          );
                        },
                      )
                    : ClipOval(
                        child: Image.file(
                        image!,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),),
              ),
              TextButton(
                onPressed: () async {
                  /* final source= await showImageSource(context);
                  if(source==null) return; */
                  _pickImage(ImageSource.gallery);
                },
                child: const Text('Chọn ảnh'),
              ),
              Text(
                'Username:',
                style: textStyleInterBold16,
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (final value) {
                  usernameController.text = value;
                },
              ),
              Text(
                'Contact:',
                style: textStyleInterBold16,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text(
                'Email:',
                style: textStyleInterBold16,
              ),
              TextField(
                enabled: false,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<UserResponseModel?> UpdateUserInfo(
    final int userId, final String name, final String phone, final String img,) async {
  try {
    final res =
        await Dio().put('${EndPoints.baseUrl}${EndPoints.user}/$userId', data: {
      'name': name,
      'phone_number': phone,
      'user_image': img,
    },);
    log('Cập nhật User thành công');
    final result = UserResponseModel.fromJson(res.data);
    return result;
  } on DioException catch (e) {
    log(e.message!);
    return null;
  }
}

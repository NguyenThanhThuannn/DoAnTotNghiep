import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import 'change_newpw_screen.dart';

class ChangeOldPasswordScreen extends StatefulWidget {
  const ChangeOldPasswordScreen({super.key});

  @override
  State<ChangeOldPasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangeOldPasswordScreen> {
  TextEditingController txtOldPassword = TextEditingController();
  bool isHidden = false;
  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.navigate_before_outlined),
          ),
          title: Text(
            'Thay đổi mật khẩu',
            style: textStylePlusJakartaSansMedium14,
          ),
          actions: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '01/',
                    style: textStylePlusJakartaSansMedium14,
                  ),
                  TextSpan(
                    text: '02',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mật khẩu cũ',
                style: textStylePlusJakartaSansBold24,
              ),
              const SizedBox(height: 8,),
              Text(
                'Nhập mật khẩu cũ để đổi mật khẩu',
                style: textStylePlusJakartaSansRegular14,
              ),
              const SizedBox(height: 8,),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'Password ',
                    style: textStylePlusJakartaSansMedium14,
                  ),
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),),
              const SizedBox(height: 8,),
              TextField(
                controller: txtOldPassword,
                obscureText: isHidden,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.grey),),
                  hintText: 'Enter your password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: isHidden
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (final context) => const ChangeNewPasswordScreen(),));
                }, child: Text('Tiếp tục',style: textStylePlusJakartaSansSemiBold14,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

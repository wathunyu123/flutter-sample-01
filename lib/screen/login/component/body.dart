import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/size.dart';
import '../../../helper/color.dart';
import '../../../widget/button.dart';
import '../../../widget/text_input/text_input.dart';
import '../../../network/model/login/login_request.dart';
import '../../../widget/text_input/text_input_password/text_input_password_bloc.dart';
import '../../../widget/text_input/text_input_username/text_input_username_bloc.dart';
import '../state/login/login_bloc.dart';

Widget body({
  required BuildContext context,
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  required AppColor appColor,
  required StateTextInputUsername username,
  required StateTextInputPassword password,
}) {
  return Align(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        inputUsername(
          context: context,
          controller: usernameController,
          icon: Icons.account_circle_outlined,
          hintText: 'ชื่อบัญชีผู้ใช้งาน...',
          isPassword: false,
          isEmail: false,
          isNumber: true,
          appColor: appColor,
        ),
        inputPassword(
          context: context,
          controller: passwordController,
          icon: Icons.lock_outline,
          hintText: 'รหัสผ่าน...',
          isPassword: true,
          isEmail: false,
          isNumber: true,
          appColor: appColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonBlur(
              context: context,
              string: 'เข้าสู่ระบบ',
              width: 2.58,
              function: () {
                HapticFeedback.lightImpact();
                // Fluttertoast.showToast(
                //     msg: 'Login button pressed');
                context.read<LoginBloc>().add(
                      EventLoginRequest(
                        context: context,
                        model: LoginRequestModel(
                          identityNumber: username.text,
                          password: password.text,
                        ),
                      ),
                    );
              },
              appColor: AppColor.instance,
            ),
            SizedBox(width: context.width / 20),
          ],
        ),
      ],
    ),
  );
}

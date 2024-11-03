import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/color.dart';
import '../../../helper/size.dart';
import '../../helper/text_style.dart';
import 'text_input_address/text_input_address_bloc.dart';
import 'text_input_height/text_input_height_bloc.dart';
import 'text_input_nickname/text_input_nickname_bloc.dart';
import 'text_input_password/text_input_password_bloc.dart';
import 'text_input_phone/text_input_phone_bloc.dart';
import 'text_input_username/text_input_username_bloc.dart';
import 'text_input_weight/text_input_weight_bloc.dart';

Widget inputUsername({
  required BuildContext context,
  required TextEditingController controller,
  required IconData icon,
  required String hintText,
  required bool isPassword,
  required bool isEmail,
  required bool isNumber,
  required AppColor appColor,
}) {
  return textInput(
    context: context,
    controller: controller,
    icon: icon,
    hintText: hintText,
    isPassword: isPassword,
    isEmail: isEmail,
    isNumber: isNumber,
    appColor: appColor,
    onChanged: (value) {
      context.read<TextInputUsernameBloc>().add(
            EventTextInputUsername(
              username: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputUsernameBloc>().add(
            EventTextInputUsername(
              username: value,
            ),
          );
    },
  );
}

Widget inputPassword({
  required BuildContext context,
  required TextEditingController controller,
  required IconData icon,
  required String hintText,
  required bool isPassword,
  required bool isEmail,
  required bool isNumber,
  required AppColor appColor,
}) {
  return textInput(
    context: context,
    controller: controller,
    icon: icon,
    hintText: hintText,
    isPassword: isPassword,
    isEmail: isEmail,
    isNumber: isNumber,
    appColor: appColor,
    onChanged: (value) {
      context.read<TextInputPasswordBloc>().add(
            EventTextInputPassword(
              password: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputPasswordBloc>().add(
            EventTextInputPassword(
              password: value,
            ),
          );
    },
  );
}

Widget textInput({
  required BuildContext context,
  required TextEditingController controller,
  required IconData icon,
  required String hintText,
  required bool isPassword,
  required bool isEmail,
  required bool isNumber,
  required AppColor appColor,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 15,
        sigmaX: 15,
      ),
      child: Container(
        height: context.width / 8,
        width: context.width / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          right: context.width / 30,
        ),
        decoration: BoxDecoration(
          color: appColor.white.withOpacity(.55),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          style: TextStyle(
            color: appColor.darkBlack.withOpacity(.8),
            fontWeight: FontWeight.bold,
          ),
          cursorColor: appColor.darkBlack,
          obscureText: isPassword,
          keyboardType: isEmail
              ? TextInputType.emailAddress
              : isNumber
                  ? TextInputType.number
                  : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: appColor.darkBlack.withOpacity(.7),
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 20,
              color: appColor.darkBlack.withOpacity(.85),
            ),
          ),
          onChanged: (value) {
            controller.text = value;
            onChanged!(value);
          },
          onSubmitted: (value) {
            controller.text = value;
            onSubmitted!(value);
          },
          // onEditingComplete: () {},
          onTapOutside: (event) {},
        ),
      ),
    ),
  );
}

Widget inputNickname({
  required BuildContext context,
  required TextEditingController controller,
  IconData? icon,
  String? labelText,
  required String hintText,
  required AppColor appColor,
  double? width,
  TextAlign? textAlign,
  String? suffixText,
  TextInputType? keyboardType,
}) {
  return textInputNormal(
    context: context,
    controller: controller,
    icon: icon,
    hintText: hintText,
    appColor: appColor,
    width: width,
    textAlign: textAlign,
    keyboardType: keyboardType,
    onChanged: (value) {
      context.read<TextInputNicknameBloc>().add(
            EventTextInputNickname(
              nickname: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputNicknameBloc>().add(
            EventTextInputNickname(
              nickname: value,
            ),
          );
    },
  );
}

Widget inputAddress({
  required BuildContext context,
  required TextEditingController controller,
  IconData? icon,
  String? labelText,
  required String hintText,
  required AppColor appColor,
  double? width,
  TextAlign? textAlign,
  String? suffixText,
  TextInputType? keyboardType,
}) {
  return textInputNormal(
    context: context,
    controller: controller,
    icon: icon,
    hintText: hintText,
    appColor: appColor,
    width: width,
    textAlign: textAlign,
    keyboardType: keyboardType,
    onChanged: (value) {
      context.read<TextInputAddressBloc>().add(
            EventTextInputAddress(
              address: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputAddressBloc>().add(
            EventTextInputAddress(
              address: value,
            ),
          );
    },
  );
}

Widget inputPhone({
  required BuildContext context,
  required TextEditingController controller,
  IconData? icon,
  String? labelText,
  required String hintText,
  required AppColor appColor,
  double? width,
  TextAlign? textAlign,
  String? suffixText,
  TextInputType? keyboardType,
}) {
  return textInputNormal(
    context: context,
    controller: controller,
    icon: icon,
    hintText: hintText,
    appColor: appColor,
    width: width,
    textAlign: textAlign,
    keyboardType: keyboardType,
    onChanged: (value) {
      context.read<TextInputPhoneBloc>().add(
            EventTextInputPhone(
              phone: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputPhoneBloc>().add(
            EventTextInputPhone(
              phone: value,
            ),
          );
    },
  );
}

Widget inputHeight({
  required BuildContext context,
  required TextEditingController controller,
  IconData? icon,
  String? labelText,
  required String hintText,
  required AppColor appColor,
  double? width,
  TextAlign? textAlign,
  String? suffixText,
  TextInputType? keyboardType,
}) {
  return textInputNormal(
    context: context,
    controller: controller,
    icon: icon,
    labelText: labelText,
    hintText: hintText,
    appColor: appColor,
    width: width,
    textAlign: textAlign,
    suffixText: suffixText,
    keyboardType: keyboardType,
    onChanged: (value) {
      context.read<TextInputHeightBloc>().add(
            EventTextInputHeight(
              height: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputHeightBloc>().add(
            EventTextInputHeight(
              height: value,
            ),
          );
    },
  );
}

Widget inputWeight({
  required BuildContext context,
  required TextEditingController controller,
  IconData? icon,
  String? labelText,
  required String hintText,
  required AppColor appColor,
  double? width,
  TextAlign? textAlign,
  String? suffixText,
  TextInputType? keyboardType,
}) {
  return textInputNormal(
    context: context,
    controller: controller,
    icon: icon,
    labelText: labelText,
    hintText: hintText,
    appColor: appColor,
    width: width,
    textAlign: textAlign,
    suffixText: suffixText,
    keyboardType: keyboardType,
    onChanged: (value) {
      context.read<TextInputWeightBloc>().add(
            EventTextInputWeight(
              weight: value,
            ),
          );
    },
    onSubmitted: (value) {
      context.read<TextInputWeightBloc>().add(
            EventTextInputWeight(
              weight: value,
            ),
          );
    },
  );
}

Widget textInputNormal({
  required BuildContext context,
  required TextEditingController controller,
  IconData? icon,
  String? labelText,
  required String hintText,
  required AppColor appColor,
  double? width,
  TextAlign? textAlign,
  String? suffixText,
  TextInputType? keyboardType,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      height: context.width / 8,
      width: width ?? context.width / 1.2,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: context.width / 30,
      ),
      decoration: BoxDecoration(
        color: appColor.darkBlack,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(color: appColor.white),
        cursorColor: appColor.white,
        obscureText: false,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: appColor.white,
                )
              : null,
          border: InputBorder.none,
          hintMaxLines: 1,
          labelText: labelText,
          labelStyle: AppTextStyle.instance.labelText,
          hintText: hintText,
          hintStyle: AppTextStyle.instance.hintText,
          suffixText: suffixText,
          suffixStyle: AppTextStyle.instance.whiteBold,
        ),
        onChanged: (value) {
          controller.text = value;
          onChanged!(value);
        },
        onSubmitted: (value) {
          controller.text = value;
          onSubmitted!(value);
        },
        // onEditingComplete: () {},
        onTapOutside: (event) {},
      ),
    ),
  );
}

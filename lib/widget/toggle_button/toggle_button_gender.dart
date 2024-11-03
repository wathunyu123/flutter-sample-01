import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'toggle_button_gender/toggle_button_gender_bloc.dart';
import '../../helper/size.dart';
import '../../helper/color.dart';

Widget toggleButton({
  required BuildContext context,
  required AppColor appColor,
  required List<Widget> children,
  double? width,
  TextAlign? textAlign,
  required StateToggleButtonGender isSelected,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      height: context.width / 4,
      width: width ?? context.width / 1.2,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: context.width / 30,
      ),
      decoration: BoxDecoration(
        color: appColor.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ToggleButtons(
        direction: Axis.horizontal,
        onPressed: (int index) {
          final List<bool> updatedGender = List<bool>.from(isSelected.gender);

          for (int i = 0; i < isSelected.gender.length; i++) {
            updatedGender[i] = i == index;
          }

          context.read<ToggleButtonGenderBloc>().add(
                EventToggleButtonGender(
                  gender: updatedGender,
                ),
              );
        },
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        selectedBorderColor: appColor.lightBlack,
        selectedColor: appColor.white,
        fillColor: appColor.darkBlack,
        color: appColor.darkBlack,
        isSelected: isSelected.gender,
        children: children,
      ),
    ),
  );
}

import 'package:flutter/material.dart';

import '../../../helper/string.dart';
import '../../../helper/color.dart';
import '../../../helper/icon.dart';
import '../../../helper/text_style.dart';
import '../../../widget/text.dart';

class ListDepartmentWidget extends StatefulWidget {
  final dynamic entry;
  final dynamic type;
  final dynamic items;
  const ListDepartmentWidget({
    super.key,
    required this.entry,
    required this.type,
    required this.items,
  });

  @override
  _ListDepartmentWidgetState createState() => _ListDepartmentWidgetState();
}

class _ListDepartmentWidgetState extends State<ListDepartmentWidget> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: const Icon(
              Icons.cases_rounded,
            ),
            title: '${widget.type}'.textOverviewCardTitle(context),
          ),
        ),
      ],
    );
  }
}

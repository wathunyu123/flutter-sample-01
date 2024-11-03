import 'package:flutter/material.dart';

import '../../../helper/string.dart';
import '../../../helper/color.dart';
import '../../../helper/icon.dart';
import '../../../helper/text_style.dart';
import '../../../widget/text.dart';

class ListMemberWidget extends StatefulWidget {
  final dynamic entry;
  final dynamic type;
  final dynamic items;
  const ListMemberWidget({
    super.key,
    required this.entry,
    required this.type,
    required this.items,
  });

  @override
  _ListUserWidgetState createState() => _ListUserWidgetState();
}

class _ListUserWidgetState extends State<ListMemberWidget> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;
  bool isOpen = false;

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
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: ListTile(
            leading: const Icon(
              Icons.bookmarks_rounded,
            ),
            title: '${widget.type} (${widget.items.length})'
                .textOverviewCardTitle(context),
          ),
        ),
        if (isOpen) ...[
          ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext itemContext, itemIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Card(
                    elevation: 5.0,
                    color: appColor.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.person_rounded,
                          ),
                          title: '${widget.items[itemIndex].identityNumber}'
                              .textOverviewCardTitle(context),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../helper/color.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String? subTitle;
  final int? itemCount;
  final List<String>? list;
  const Accordion({
    super.key,
    required this.title,
    this.subTitle,
    this.itemCount,
    this.list,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  final AppColor appColor = AppColor.instance;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          leading:
              widget.list!.isNotEmpty ? const Icon(Icons.folder_rounded) : null,
          title: Text(
            widget.title,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          subtitle: widget.subTitle != null
              ? Text(
                  widget.subTitle!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              : null,
          trailing: widget.list!.isNotEmpty
              ? Icon(
                  isExpanded
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                )
              : const Icon(null),
          onExpansionChanged: (bool expanded) {
            if (widget.list!.isNotEmpty) {
              setState(() {
                isExpanded = expanded;
              });
            }
          },
          children: <Widget>[
            if (widget.itemCount! > 0) ...[
              if (widget.list!.isNotEmpty) ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: widget.itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      leading: const Icon(Icons.check_rounded),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${widget.list![index]}',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(null),
                    );
                  },
                ),
              ],
            ] else
              ...[],
          ],
        ),
      ],
    );
  }
}

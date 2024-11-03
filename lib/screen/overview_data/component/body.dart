import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/string.dart';
import '../../../helper/size.dart';
import '../../../helper/icon.dart';
import '../../../helper/color.dart';
import '../../../helper/text_style.dart';
import '../../../widget/button.dart';
import '../../../storage/Department/department_bloc.dart';
import '../../../widget/load.dart';
import '../../../widget/text.dart';
import '../../nutrition_assessment/state/get_body_info/get_body_info_bloc.dart';
import '../state/overview_data_department/overview_data_department_bloc.dart';
import '../state/overview_data_user/overview_data_user_bloc.dart';
import 'listDetail.dart';
import 'piechart.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    super.key,
  });

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;

  bool isResult1 = false;
  bool isResult2 = false;
  bool isResult3 = false;

  var oResult1;
  var oResult2;
  var oResult3;

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
    var data = context.select((GetBodyInfoBloc bloc) => bloc.state);
    var department = context.select((DepartmentBloc bloc) => bloc.state);
    var oUser = context.select((GetOverviewDataUserBloc bloc) => bloc.state);
    var oDepartment =
        context.select((GetOverviewDataDepartmentBloc bloc) => bloc.state);

    if (data is StateGetBodyInfoAllFetchSuccess) {
      oResult1 = groupBy(data.model, (obj) => obj.result1);
      oResult2 = groupBy(data.model, (obj) => obj.result2);
      oResult3 = groupBy(data.model, (obj) => obj.result3);
    }

    return Align(
      alignment: Alignment.center,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: appColor.white.withOpacity(.55),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      width: context.width * .9,
                      height: context.height * .9,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: context.height * .835,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColor.white,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 3.0,
                                      ),
                                      child: department.departmentName
                                          .textDepartment(context),
                                    ),
                                  ),
                                  if (oUser
                                      is StateOverviewDataUserFetchSuccess) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
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
                                                    title:
                                                        'จำนวนข้อมูลที่บันทึก'
                                                            .textSubDepartment(
                                                                context),
                                                    subtitle:
                                                        '${oUser.countUser} รายการ'
                                                            .textDepartment(
                                                                context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  if (oDepartment
                                      is StateOverviewDataDepartmentFetchSuccess) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
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
                                                      Icons.book_rounded,
                                                    ),
                                                    title:
                                                        'จำนวนข้อมูลที่สังกัดมีทั้งหมด'
                                                            .textSubDepartment(
                                                                context),
                                                    subtitle:
                                                        '${oDepartment.countDepartment} รายการ'
                                                            .textDepartment(
                                                                context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  if (data
                                      is StateGetBodyInfoAllFetchSuccess) ...[
                                    ListTile(
                                      title: 'น้ำหนักตามเกณฑ์อายุ'
                                          .textOverviewCardTitle(context),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: oResult1.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final entry =
                                              oResult1.entries.toList()[index];
                                          final type = entry.key;
                                          final items = entry.value;
                                          return ListDetailWidget(
                                            entry: entry,
                                            type: type,
                                            items: items,
                                          );
                                        }),
                                  ],
                                  ///////////
                                  if (data
                                      is StateGetBodyInfoAllFetchSuccess) ...[
                                    ListTile(
                                      title: 'ส่วนสูงตามเกณฑ์อายุ'
                                          .textOverviewCardTitle(context),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: oResult2.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final entry =
                                              oResult2.entries.toList()[index];
                                          final type = entry.key;
                                          final items = entry.value;
                                          return ListDetailWidget(
                                            entry: entry,
                                            type: type,
                                            items: items,
                                          );
                                        }),
                                  ],
                                  ///////////
                                  if (data
                                      is StateGetBodyInfoAllFetchSuccess) ...[
                                    ListTile(
                                      title: 'น้ำหนักตามเกณฑ์ส่วนสูง'
                                          .textOverviewCardTitle(context),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: oResult3.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final entry =
                                              oResult3.entries.toList()[index];
                                          final type = entry.key;
                                          final items = entry.value;
                                          return ListDetailWidget(
                                            entry: entry,
                                            type: type,
                                            items: items,
                                          );
                                        }),
                                  ],
                                  ///////////
                                  if (oUser
                                          is StateOverviewDataUserFetchSuccess &&
                                      oDepartment
                                          is StateOverviewDataDepartmentFetchSuccess) ...[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 15.0,
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: 'อัตราส่วนข้อมูลสังกัด'
                                                .textOverviewCardTitle(context),
                                          ),
                                          const PieChartSample2(),
                                        ],
                                      ),
                                    ),
                                  ] else if (oUser
                                          is StateGetOverviewDataUserFetchError ||
                                      oDepartment
                                          is StateGetOverviewDataDepartmentFetchError) ...[
                                    ConstrainedBox(
                                      constraints: BoxConstraints.expand(
                                        height: context.height * .765,
                                      ),
                                      child: Center(
                                        child: 'ไม่พบข้อมูล'
                                            .textDepartment(context),
                                      ),
                                    ),
                                  ] else ...[
                                    ConstrainedBox(
                                      constraints: BoxConstraints.expand(
                                        height: context.height * .765,
                                      ),
                                      child: Center(
                                        child: loading(context: context),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              backButton(
                                context: context,
                                appColor: appColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

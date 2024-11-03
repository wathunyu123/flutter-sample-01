import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/Access_Token/access_token_bloc.dart';
import '../../storage/Creator/creator_bloc.dart';
import '../../storage/Department/department_bloc.dart';
import '../nutrition_assessment/state/get_body_info/get_body_info_bloc.dart';
import 'component/body.dart';
import '../../helper/text_style.dart';
import '../../widget/text.dart';
import '../login/component/behavior.dart';
import '../../helper/size.dart';
import '../../helper/icon.dart';
import '../../helper/color.dart';
import '../../widget/background.dart';
import 'state/overview_data_department/overview_data_department_bloc.dart';
import 'state/overview_data_user/overview_data_user_bloc.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class OverviewDataScreen extends StatefulWidget {
  const OverviewDataScreen({super.key});

  @override
  _OverviewDataScreenState createState() => _OverviewDataScreenState();
}

class _OverviewDataScreenState extends State<OverviewDataScreen> {
  final AppColor appColor = AppColor.instance;
  final AppIcon appIcon = AppIcon.instance;
  final AppText appText = AppText.instance;
  final AppTextStyle appTextStyle = AppTextStyle.instance;
  final int flexBody = 9;
  bool isStart = true;

  @override
  void initState() {
    initBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var storage = context.select((AccessTokenBloc bloc) => bloc.state);
    var data = context.select((GetBodyInfoBloc bloc) => bloc.state);
    var user = context.select((CreatorBloc bloc) => bloc.state);
    var department = context.select((DepartmentBloc bloc) => bloc.state);
    var overviewDataUser =
        context.select((GetOverviewDataUserBloc bloc) => bloc.state);
    var overviewDataDepartment =
        context.select((GetOverviewDataDepartmentBloc bloc) => bloc.state);
    prepare(
      data: data,
      storage: storage,
      user: user,
    );
    return Scaffold(
      backgroundColor: appColor.lightBlack,
      body: ScrollConfiguration(
        behavior: LoginBehavior(),
        child: SizedBox(
          height: context.height,
          child: Stack(
            children: [
              const Background(),
              Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: context.height,
                    ),
                    child: const BodyWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initBloc() {
    context.read<GetBodyInfoBloc>().add(
          EventGetBodyInfoInitial(),
        );
    context.read<GetOverviewDataUserBloc>().add(
          EventOverviewDataUserInitial(),
        );
    context.read<GetOverviewDataDepartmentBloc>().add(
          EventOverviewDataDepartmentInitial(),
        );
  }

  void prepare({
    required GetBodyInfoState data,
    required StateAccessToken storage,
    required StateCreator user,
  }) {
    if (isStart) {
      setState(() {
        isStart = !isStart;
      });
      context.read<GetOverviewDataUserBloc>().add(
            EventOverviewDataUserFetching(
              context: context,
              userId: user.by,
            ),
          );
      if (storage.permission.level > -1) {
        context.read<GetOverviewDataDepartmentBloc>().add(
              EventOverviewDataDepartmentFetching(
                context: context,
                departmentId: storage.permission.department,
              ),
            );
      }
    }
    if (data is StateGetBodyInfoInitial) {
      context.read<GetBodyInfoBloc>().add(
            EventGetBodyInfoAllFetching(
              context: context,
              userId: user.by,
            ),
          );
    }
  }
}

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
import 'state/admin_controller_department/admin_controller_department_bloc.dart';
import 'state/admin_controller_user/admin_controller_user_bloc.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class AdminControllerScreen extends StatefulWidget {
  const AdminControllerScreen({super.key});

  @override
  _AdminControllerScreenState createState() => _AdminControllerScreenState();
}

class _AdminControllerScreenState extends State<AdminControllerScreen> {
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
        context.select((GetAdminControllerUserBloc bloc) => bloc.state);
    var overviewDataDepartment =
        context.select((GetAdminControllerDepartmentBloc bloc) => bloc.state);
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
    context.read<GetAdminControllerUserBloc>().add(
          EventAdminControllerUserInitial(),
        );
    context.read<GetAdminControllerDepartmentBloc>().add(
          EventAdminControllerDepartmentInitial(),
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
      context.read<GetAdminControllerUserBloc>().add(
            EventAdminControllerUserFetching(
              context: context,
              departmentId: storage.permission.department,
            ),
          );
      if (storage.permission.level > 0) {
        context.read<GetAdminControllerDepartmentBloc>().add(
              EventAdminControllerDepartmentFetching(
                context: context,
                level: storage.permission.level,
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

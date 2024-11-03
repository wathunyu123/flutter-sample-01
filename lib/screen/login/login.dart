import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/version.dart';
import 'component/body.dart';
import 'component/footer.dart';
import 'component/header.dart';
import 'component/behavior.dart';
import 'state/login/login_bloc.dart';
import '../../helper/size.dart';
import '../../helper/color.dart';
import '../../widget/background.dart';
import '../../widget/text_input/text_input_password/text_input_password_bloc.dart';
import '../../widget/text_input/text_input_username/text_input_username_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AppColor appColor = AppColor.instance;
  final Version version = Version.instance;
  final int flextHeader = 5;
  final int flexBody = 7;
  final int flexFooter = 6;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    context.read<LoginBloc>().add(
          EventLoginInitial(),
        );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var username = context.select((TextInputUsernameBloc bloc) => bloc.state);
    var password = context.select((TextInputPasswordBloc bloc) => bloc.state);
    return Scaffold(
      backgroundColor: appColor.lightBlack,
      body: ScrollConfiguration(
        behavior: LoginBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            child: Stack(
              children: [
                const Background(),
                Column(
                  children: [
                    Expanded(
                      flex: flextHeader,
                      child: header(
                        context: context,
                      ),
                    ),
                    Expanded(
                      flex: flexBody,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: body(
                          context: context,
                          usernameController: usernameController,
                          passwordController: passwordController,
                          appColor: appColor,
                          username: username,
                          password: password,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: flexFooter,
                      child: footer(
                        context: context,
                        version: version,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

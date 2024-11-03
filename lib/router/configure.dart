import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/admin_controller/admin_controller.dart';
import '../screen/input_body_info/edit_body_info.dart';
import '../screen/nutrition_assessment/nutrition_assessment.dart';
import '../screen/nutrition_assessment/nutrition_assessment_detail.dart';
import '../screen/overview_data/overview_data.dart';
import 'define.dart';
import '../screen/login/login.dart';
import '../screen/home/home.dart';
import '../screen/input_body_info/input_body_info.dart';

// Ref:
// https://medium.com/@chuntdevnx/go-router-routing-in-flutter-bc3c69e85786

final router = GoRouter(
  initialLocation: RouterName.login.toPath,
  routes: [
    GoRoute(
      name: RouterName.login.toName,
      path: RouterName.login.toPath,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RouterName.home.toName,
      path: RouterName.home.toPath,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
        transitionsBuilder: (
          context,
          animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
      // routes: <RouteBase>[],
    ),
    GoRoute(
      name: RouterName.inputBodyInfo.toName,
      path: RouterName.inputBodyInfo.toPath,
      builder: (context, state) => const InputBodyInfoScreen(),
    ),
    GoRoute(
      name: RouterName.editBodyInfo.toName,
      path: RouterName.editBodyInfo.toPath,
      builder: (context, state) => const EditBodyInfoScreen(),
    ),
    GoRoute(
      name: RouterName.nutritionAssessment.toName,
      path: RouterName.nutritionAssessment.toPath,
      builder: (context, state) => const NutritionAssessmentScreen(),
    ),
    GoRoute(
      name: RouterName.nutritionAssessmentDetail.toName,
      path: RouterName.nutritionAssessmentDetail.toPath,
      builder: (context, state) => const NutritionAssessmentDetailScreen(),
    ),
    GoRoute(
      name: RouterName.overviewData.toName,
      path: RouterName.overviewData.toPath,
      builder: (context, state) => const OverviewDataScreen(),
    ),
    GoRoute(
      name: RouterName.adminController.toName,
      path: RouterName.adminController.toPath,
      builder: (context, state) => const AdminControllerScreen(),
    ),
  ],
);

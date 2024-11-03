enum RouterName {
  login,
  home,
  inputBodyInfo,
  editBodyInfo,
  nutritionAssessment,
  nutritionAssessmentDetail,
  overviewData,
  adminController,
  error,
}

extension RouterDefine on RouterName {
  String get toPath {
    switch (this) {
      case RouterName.login:
        return "/login";
      case RouterName.home:
        return "/home";
      case RouterName.inputBodyInfo:
        return "/input_body_info";
      case RouterName.editBodyInfo:
        return "/edit_body_info";
      case RouterName.nutritionAssessment:
        return "/nutrition_assessment";
      case RouterName.nutritionAssessmentDetail:
        return "/nutrition_assessment_detail";
      case RouterName.overviewData:
        return "/overview_data";
      case RouterName.adminController:
        return "/admin_controller";
      case RouterName.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case RouterName.login:
        return "LOGIN";
      case RouterName.home:
        return "HOME";
      case RouterName.inputBodyInfo:
        return "INPUTBODYINFO";
      case RouterName.editBodyInfo:
        return "EDITBODYINFO";
      case RouterName.nutritionAssessment:
        return "NUTRITIONASSESSMENT";
      case RouterName.nutritionAssessmentDetail:
        return "NUTRITIONASSESSMENTDETAIL";
      case RouterName.overviewData:
        return "OVERVIEWDATA";
      case RouterName.adminController:
        return "ADMINCONTROLLER";
      case RouterName.error:
        return "ERROR";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case RouterName.login:
        return "Login";
      case RouterName.home:
        return "Home";
      case RouterName.inputBodyInfo:
        return "Input Body Info";
      case RouterName.editBodyInfo:
        return "Edit Body Info";
      case RouterName.nutritionAssessment:
        return "Nutrition Assessment";
      case RouterName.nutritionAssessmentDetail:
        return "Nutrition Assessment Detail";
      case RouterName.overviewData:
        return "Overview Data";
      case RouterName.adminController:
        return "Admin Controller";
      case RouterName.error:
        return "Error";
      default:
        return "App";
    }
  }
}

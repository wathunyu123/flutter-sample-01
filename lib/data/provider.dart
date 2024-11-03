import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/api/admin_api.dart';
import '../network/api/input_body_info.dart';
import '../network/api/login.dart';

import '../network/api/overview_api.dart';
import '../screen/admin_controller/state/admin_controller_department/admin_controller_department_bloc.dart';
import '../screen/admin_controller/state/admin_controller_user/admin_controller_user_bloc.dart';
import '../screen/input_body_info/state/add_body_info/add_body_info_bloc.dart';
import '../screen/input_body_info/state/delete_body_info/delete_body_info_bloc.dart';
import '../screen/input_body_info/state/edit_body_info/edit_body_info_bloc.dart';
import '../screen/login/state/login/login_bloc.dart';
import '../screen/nutrition_assessment/state/calculate_body_info/calculate_body_info_bloc.dart';
import '../screen/nutrition_assessment/state/get_body_info/get_body_info_bloc.dart';
import '../screen/nutrition_assessment/state/get_level_recommend_info/get_level_recommend_info_bloc.dart';
import '../screen/nutrition_assessment/state/get_recommend_info/get_recommend_info_bloc.dart';
import '../screen/nutrition_assessment/state/select_body_info/select_body_info_bloc.dart';
import '../screen/overview_data/state/overview_data_department/overview_data_department_bloc.dart';
import '../screen/overview_data/state/overview_data_user/overview_data_user_bloc.dart';
import '../storage/Access_Token/access_token_bloc.dart';
import '../storage/Creator/creator_bloc.dart';
import '../network/api/department_api.dart';
import '../storage/Department/department_bloc.dart';
import '../storage/Permission/permission_bloc.dart';
import '../widget/select/select_birth_day/select_birth_day_bloc.dart';
import '../widget/select/select_birth_month/select_birth_month_bloc.dart';
import '../widget/select/select_birth_year/select_birth_year_bloc.dart';
import '../widget/select/select_measure_day/select_measure_day_bloc.dart';
import '../widget/select/select_measure_month/select_measure_month_bloc.dart';
import '../widget/select/select_measure_year/select_measure_year_bloc.dart';
import '../widget/text_input/text_input_address/text_input_address_bloc.dart';
import '../widget/text_input/text_input_height/text_input_height_bloc.dart';
import '../widget/text_input/text_input_nickname/text_input_nickname_bloc.dart';
import '../widget/text_input/text_input_password/text_input_password_bloc.dart';
import '../widget/text_input/text_input_phone/text_input_phone_bloc.dart';
import '../widget/text_input/text_input_username/text_input_username_bloc.dart';
import '../widget/text_input/text_input_weight/text_input_weight_bloc.dart';
import '../widget/toggle_button/toggle_button_gender/toggle_button_gender_bloc.dart';

// Login State
var loginBloc = LoginBloc(APILogin());
var login = BlocProvider<LoginBloc>(
  create: (context) => loginBloc,
);

// Add Body Info State
var addBodyInfoBloc = AddBodyInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var addBodyInfo = BlocProvider<AddBodyInfoBloc>(
  create: (context) => addBodyInfoBloc,
);

// Get Body Info State
var getBodyInfoBloc = GetBodyInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getBodyInfo = BlocProvider<GetBodyInfoBloc>(
  create: (context) => getBodyInfoBloc,
);

// Edit Body Info State
var editBodyInfoBloc = EditBodyInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var editBodyInfo = BlocProvider<EditBodyInfoBloc>(
  create: (context) => editBodyInfoBloc,
);

// Delete Body Info State
var deleteBodyInfoBloc = DeleteBodyInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var deleteBodyInfo = BlocProvider<DeleteBodyInfoBloc>(
  create: (context) => deleteBodyInfoBloc,
);

// Select Body Info State
var selectBodyInfoBloc = SelectBodyInfoBloc();
var selectBodyInfo = BlocProvider<SelectBodyInfoBloc>(
  create: (context) => selectBodyInfoBloc,
);

// Calculate Body Info State
var calculateBodyInfoBloc = CalculateBodyInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var calculateBodyInfo = BlocProvider<CalculateBodyInfoBloc>(
  create: (context) => calculateBodyInfoBloc,
);

// Get Recommend Info State
var getRecommendInfoBloc = GetRecommendInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getRecommendInfo = BlocProvider<GetRecommendInfoBloc>(
  create: (context) => getRecommendInfoBloc,
);

// Get Overview Data User State
var getOverviewDataUserBloc = GetOverviewDataUserBloc(
  APIOverviewData(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getOverviewDataUser = BlocProvider<GetOverviewDataUserBloc>(
  create: (context) => getOverviewDataUserBloc,
);

// Get Overview Data Department State
var getOverviewDataDepartmentBloc = GetOverviewDataDepartmentBloc(
  APIOverviewData(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getOverviewDataDepartment = BlocProvider<GetOverviewDataDepartmentBloc>(
  create: (context) => getOverviewDataDepartmentBloc,
);

// Get Admin Controller User State
var getAdminControllerUserBloc = GetAdminControllerUserBloc(
  APIAdmin(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getAdminControllerUser = BlocProvider<GetAdminControllerUserBloc>(
  create: (context) => getAdminControllerUserBloc,
);

// Get Admin Controller Department State
var getAdminControllerDepartmentBloc = GetAdminControllerDepartmentBloc(
  APIAdmin(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getAdminControllerDepartment =
    BlocProvider<GetAdminControllerDepartmentBloc>(
  create: (context) => getAdminControllerDepartmentBloc,
);

// Get Level Recommend Info State
var getLevelRecommendInfoBloc = GetLevelRecommendInfoBloc(
  APIBodyInfo(
    accessTokenBloc: accessTokenBloc,
  ),
);
var getLevelRecommendInfo = BlocProvider<GetLevelRecommendInfoBloc>(
  create: (context) => getLevelRecommendInfoBloc,
);

// Creator State
var creatorBloc = CreatorBloc();
var creator = BlocProvider<CreatorBloc>(
  create: (context) => creatorBloc,
);

// Access Token State
var accessTokenBloc = AccessTokenBloc();
var accessToken = BlocProvider<AccessTokenBloc>(
  create: (context) => accessTokenBloc,
);

// Permission State
var permissionBloc = PermissionBloc();
var permission = BlocProvider<PermissionBloc>(
  create: (context) => permissionBloc,
);

// Department State
var departmentBloc = DepartmentBloc(
  APIDepartment(
    accessTokenBloc: accessTokenBloc,
  ),
);
var department = BlocProvider<DepartmentBloc>(
  create: (context) => departmentBloc,
);

// Text Input Username
var textInputUsernameBloc = TextInputUsernameBloc();
var textInputUsername = BlocProvider<TextInputUsernameBloc>(
  create: (context) => textInputUsernameBloc,
);

// Text Input Password
var textInputPasswordBloc = TextInputPasswordBloc();
var textInputPassword = BlocProvider<TextInputPasswordBloc>(
  create: (context) => textInputPasswordBloc,
);

// Gender Toggle Button
var toggleButtonGenderBloc = ToggleButtonGenderBloc();
var toggleButtonGender = BlocProvider<ToggleButtonGenderBloc>(
  create: (context) => toggleButtonGenderBloc,
);

// Text Input Nickname
var textInputNicknameBloc = TextInputNicknameBloc();
var textInputNickname = BlocProvider<TextInputNicknameBloc>(
  create: (context) => textInputNicknameBloc,
);

// Text Input Address
var textInputAddressBloc = TextInputAddressBloc();
var textInputAddress = BlocProvider<TextInputAddressBloc>(
  create: (context) => textInputAddressBloc,
);

// Text Input Phone
var textInputPhoneBloc = TextInputPhoneBloc();
var textInputPhone = BlocProvider<TextInputPhoneBloc>(
  create: (context) => textInputPhoneBloc,
);

// Text Input Height
var textInputHeightBloc = TextInputHeightBloc();
var textInputHeight = BlocProvider<TextInputHeightBloc>(
  create: (context) => textInputHeightBloc,
);

// Text Input Weight
var textInputWeightBloc = TextInputWeightBloc();
var textInputWeight = BlocProvider<TextInputWeightBloc>(
  create: (context) => textInputWeightBloc,
);

// Select Birth Day
var selectBirthDayBloc = SelectBirthDayBloc();
var selectBirthDay = BlocProvider<SelectBirthDayBloc>(
  create: (context) => selectBirthDayBloc,
);

// Select Birth Month
var selectBirthMonthBloc = SelectBirthMonthBloc();
var selectBirthMonth = BlocProvider<SelectBirthMonthBloc>(
  create: (context) => selectBirthMonthBloc,
);

// Select Birth Year
var selectBirthYearBloc = SelectBirthYearBloc();
var selectBirthYear = BlocProvider<SelectBirthYearBloc>(
  create: (context) => selectBirthYearBloc,
);

// Select Measure Day
var selectMeasureDayBloc = SelectMeasureDayBloc();
var selectMeasureDay = BlocProvider<SelectMeasureDayBloc>(
  create: (context) => selectMeasureDayBloc,
);

// Select Measure Month
var selectMeasureMonthBloc = SelectMeasureMonthBloc();
var selectMeasureMonth = BlocProvider<SelectMeasureMonthBloc>(
  create: (context) => selectMeasureMonthBloc,
);

// Select Measure Year
var selectMeasureYearBloc = SelectMeasureYearBloc();
var selectMeasureYear = BlocProvider<SelectMeasureYearBloc>(
  create: (context) => selectMeasureYearBloc,
);

class AppProviders {
  AppProviders._();
  static final instance = AppProviders._();

  List<BlocProvider> data = [
    // Login State
    login,
    // Add Body Info State
    addBodyInfo,
    // Get Body Info State
    getBodyInfo,
    // Edit Body Info State
    editBodyInfo,
    // Delete Body Info State
    deleteBodyInfo,
    // Select Body Info State
    selectBodyInfo,
    // Calculate Body Info State
    calculateBodyInfo,
    // Get Recommend Info State
    getRecommendInfo,
    // Get Overview Data User State
    getOverviewDataUser,
    // Get Overview Data Department State
    getOverviewDataDepartment,
    // Get Admin Controller User State
    getAdminControllerUser,
    // Get Admin Controller Department State
    getAdminControllerDepartment,
    // Get Level Recommend Info State
    getLevelRecommendInfo,
    // Creator State
    creator,
    // Access Token State
    accessToken,
    // Permission State
    permission,
    // Department State
    department,
    // Text Input Username
    textInputUsername,
    // Text Input Password
    textInputPassword,
    // Gender Toggle Button
    toggleButtonGender,
    // Text Input Nickname
    textInputNickname,
    // Text Input Address
    textInputAddress,
    // Text Input Phone
    textInputPhone,
    // Text Input Height
    textInputHeight,
    // Text Input Weight
    textInputWeight,
    // Select Birth Day
    selectBirthDay,
    // Select Birth Month
    selectBirthMonth,
    // Select Birth Year
    selectBirthYear,
    // Select Measure Day
    selectMeasureDay,
    // Select Birth Month
    selectMeasureMonth,
    // Select Measure Year
    selectMeasureYear,
  ];

  void dispose() {
    // Login State
    loginBloc.close();
    // Add Body Info State
    addBodyInfoBloc.close();
    // Get Body Info State
    getBodyInfoBloc.close();
    // Edit Body Info State
    editBodyInfoBloc.close();
    // Delete Body Info State
    deleteBodyInfoBloc.close();
    // Select Body Info State
    selectBodyInfoBloc.close();
    // Calculate Body Info State
    calculateBodyInfoBloc.close();
    // Get Recommend Info State
    getRecommendInfoBloc.close();
    // Get Overview Data User State
    getOverviewDataUserBloc.close();
    // Get Overview Data Department State
    getOverviewDataDepartmentBloc.close();
    // Get Admin Controller User State
    getAdminControllerUserBloc.close();
    // Get Admin Controller Department State
    getAdminControllerDepartmentBloc.close();
    // Get Level Recommend Info State
    getLevelRecommendInfoBloc.close();
    // Creator State
    creatorBloc.close();
    // Access Token State
    accessTokenBloc.close();
    // Permission State
    permissionBloc.close();
    // Department State
    departmentBloc.close();
    // Text Input Username
    textInputUsernameBloc.close();
    // Text Input Password
    textInputPasswordBloc.close();
    // Gender Toggle Button
    toggleButtonGenderBloc.close();
    // Text Input Nickname
    textInputNicknameBloc.close();
    // Text Input Address
    textInputAddressBloc.close();
    // Text Input Phone
    textInputPhoneBloc.close();
    // Text Input Height
    textInputHeightBloc.close();
    // Text Input Weight
    textInputWeightBloc.close();
    // Select Birth Day
    selectBirthDayBloc.close();
    // Select Birth Month
    selectBirthMonthBloc.close();
    // Select Birth Year
    selectBirthYearBloc.close();
    // Select Measure Day
    selectMeasureDayBloc.close();
    // Select Measure Month
    selectMeasureMonthBloc.close();
    // Select Measure Year
    selectMeasureYearBloc.close();
  }
}

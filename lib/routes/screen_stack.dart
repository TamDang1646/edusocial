import 'package:edusocial/pages/group/group_screen.dart';
import 'package:edusocial/pages/home_screen/home_screen.dart';
import 'package:edusocial/pages/join_room/join_room_screen.dart';
import 'package:edusocial/pages/login_screen/login_screen.dart';
import 'package:edusocial/pages/main_screen/main_screen.dart';
import 'package:edusocial/pages/message/message_screen.dart';
import 'package:edusocial/pages/otp_screen/otp_screen.dart';
import 'package:edusocial/pages/post_detail/post_detail.dart';
import 'package:edusocial/pages/setting/setting_screen.dart';
import 'package:edusocial/pages/signup_screen/signup_screen.dart';
import 'package:edusocial/pages/user_profile/user_profile_screen.dart';

import '../pages/change_password/change_password.dart';
import '../pages/new_password/new_password.dart';
import 'routes.dart';

getRoutes() {
  return {
    Routes.homeScreen: (context) => const MyHomeScreen(),
    Routes.loginScreen: (context) => const LoginScreen(),
    Routes.signupScreen: (context) => const SignUpScreen(),
    Routes.forgotPasswordScreen: (context) => const NewPasswordScreen(),
    Routes.changePasswordScreen: (context) => const ChangePasswordScreen(),
    Routes.otpScreen: (context) => const OTPScreen(),
    Routes.postDetailScreen: (context) => const PostDetail(),
    Routes.groupScreen: (context) => const GroupScreen(),
    Routes.messageScreen: (context) => const MessageScreen(),
    Routes.settingScreen: (context) => const SettingScreen(),
    Routes.userProfileScreen: (context) => const UserProfileScreen(),
    Routes.mainScreen: (context) => const MainScreen(),
    Routes.joinMeetingingScreen: (context) => const JoinRoomScreen(),
  };
}

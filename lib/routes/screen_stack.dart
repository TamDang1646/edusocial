import 'package:my_app/screens/group/group_screen.dart';
import 'package:my_app/screens/home_screen/home_screen.dart';
import 'package:my_app/screens/join_room/join_room_screen.dart';
import 'package:my_app/screens/login_screen/login_screen.dart';
import 'package:my_app/screens/main_screen/main_screen.dart';
import 'package:my_app/screens/message/message_screen.dart';
import 'package:my_app/screens/otp_screen/otp_screen.dart';
import 'package:my_app/screens/post_detail/post_detail.dart';
import 'package:my_app/screens/setting/setting_screen.dart';
import 'package:my_app/screens/signup_screen/signup_screen.dart';
import 'package:my_app/screens/user_profile/user_profile_screen.dart';

import '../screens/change_password/change_password.dart';
import '../screens/new_password/new_password.dart';
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

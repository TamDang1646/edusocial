import 'package:flutter/material.dart';
import 'package:my_app/utils/app_utils.dart';
import '../../components/button-custom.dart';
import '../../components/tabbar-custom.dart';
import '../../components/text-field-input.dart';
import '../../constains/images.dart';
import '../../constains/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _sdtController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
    _sdtController.addListener(() {
      final String text = _sdtController.text.toLowerCase();
      _sdtController.value = _sdtController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _passController.addListener(() {
      final String text = _passController.text.toLowerCase();
      _passController.value = _passController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _sdtController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(Images.logo),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextInputCustom(
                    label: "Phone Number",
                    // hintLabel: "Phone Number",
                    obscureText: true,
                    suffixIcon: Icons.phone,
                    controller: _sdtController,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: TextInputCustom(
                      label: "Password",
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      controller: _passController,
                    )),
                SizedBox(height: Responsive.scale(30, context)),
                RoundedButton(
                  title: "Signin",
                  onPressed: () {
                    print("Tapped Me");
                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Chưa có tài khoản."),
                      TextButton(
                          onPressed: () {
                            print("register");
                          },
                          child: Text("Đăng ký ngay"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

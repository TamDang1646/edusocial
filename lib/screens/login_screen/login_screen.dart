import 'package:flutter/material.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/routes/screen_stack.dart';
import 'package:my_app/utils/app_utils.dart';
import '../../components/button/button-custom.dart';
import '../../components/tabbar-custom.dart';
import '../../components/text_input/text-field-input.dart';
import '../../constains/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  final String route = Routes.signupScreen;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _sdtController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  late String _sdtText;
  late String _passText;
  late bool _showPass;
  @override
  void initState() {
    _showPass = true;
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.logo),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextInputCustom(
                  label: "Phone Number",
                  // hintLabel: "Phone Number",
                  suffixIcon: Icons.phone,
                  controller: _sdtController,
                  onChange: (text) => {
                    setState(() {
                      _sdtText = text;
                    })
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextInputCustom(
                    label: "Password",
                    obscureText: _showPass,
                    suffixIcon: _showPass ? Icons.visibility : Icons.visibility_off,
                    suffixPress: () => {
                      setState(() {
                        _showPass = !_showPass;
                      }),
                    },
                    controller: _passController,
                    onChange: (text) => {
                      setState(() {
                        _passText = text;
                      })
                    },
                  )),
              SizedBox(height: Responsive.scale(30, context)),
              RoundedButton(
                title: "Sign in",
                onPressed: () {
                  // ignore: avoid_print
                  print("Tapped Me");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Chưa có tài khoản."),
                  TextButton(
                      onPressed: () {
                        //   Navigator.push(builder: MainStack(context).stackScreen);
                        // ignore: avoid_print
                        print("register");
                        Navigator.pushNamed(context, Routes.signupScreen);
                      },
                      child: const Text("Đăng ký ngay"))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

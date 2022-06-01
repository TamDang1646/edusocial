import 'package:flutter/material.dart';
import 'package:my_app/utils/app_utils.dart';
import '../../components/button/button-custom.dart';
import '../../components/text_input/text-field-input.dart';
import '../../constains/images.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _sdtController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();
  late String _sdtText;
  late String _passText;
  late String _rePassText;
  bool _showPass = true;
  bool _showRePass = true;
  @override
  void initState() {
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
    _rePassController.addListener(() {
      final String text = _rePassController.text.toLowerCase();
      _rePassController.value = _rePassController.value.copyWith(
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
    _rePassController.dispose();
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextInputCustom(
                    label: "Re-Password",
                    obscureText: _showRePass,
                    suffixIcon: _showRePass ? Icons.visibility : Icons.visibility_off,
                    suffixPress: () => {
                      setState(() {
                        _showRePass = !_showRePass;
                      }),
                    },
                    controller: _rePassController,
                    onChange: (text) => {
                      setState(() {
                        _rePassText = text;
                      })
                    },
                  ),
                ),
                SizedBox(height: Responsive.scale(30, context)),
                RoundedButton(
                  title: "Sign Up",
                  onPressed: () {
                    // ignore: avoid_print
                    print("Tapped Me");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

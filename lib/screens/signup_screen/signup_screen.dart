import 'package:edusocial/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../constains/images.dart';
import '../../routes/routes.dart';
import '../../widgets/button/button-custom.dart';
import '../../widgets/text_input/text-field-input.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.logo),
          SizedBox(
            height: Responsive.scale(30, context),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextInputCustom(
                  label: "Phone Number",
                  // hintLabel: "Phone Number",
                  suffixIcon: const Icon(Icons.phone),
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
                  suffixIcon: IconButton(
                    onPressed: () => {
                      setState(() {
                        _showPass = !_showPass;
                      }),
                    },
                    icon: Icon(_showPass ? Icons.visibility : Icons.visibility_off),
                    iconSize: 20,
                    highlightColor: Colors.amber,
                  ),
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
                  suffixIcon: IconButton(
                    onPressed: () => {
                      setState(() {
                        _showRePass = !_showRePass;
                      }),
                    },
                    icon: Icon(_showRePass ? Icons.visibility : Icons.visibility_off),
                    iconSize: 20,
                    highlightColor: Colors.amber,
                  ),
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
                boxDecoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xff1f005c),
                      Color(0xff5b0060),
                      Color(0xff870160),
                      Color(0xffac255e),
                      Color(0xffca485c),
                      Color(0xffe16b5c),
                      Color(0xfff39060),
                      Color(0xffffb56b),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                  borderRadius: BorderRadius.circular(Responsive.scale(20, context)),
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print("Tapped Me");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Đã có tài khoản."),
                  TextButton(
                      onPressed: () {
                        //   Navigator.push(builder: MainStack(context).stackScreen);
                        // ignore: avoid_print
                        print("register");
                        Navigator.pop(context);
                      },
                      child: const Text("Đăng nhập ngay"))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

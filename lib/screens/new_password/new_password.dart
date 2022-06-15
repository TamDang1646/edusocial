import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constains/images.dart';
import '../../routes/routes.dart';
import '../../utils/app_utils.dart';
import '../../widgets/button/button-custom.dart';
import '../../widgets/text_input/text-field-input.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
//   String _sdtText = "";
//   String _passText = "";
  late bool _showPass;
  late bool _showRePass;
  String _validatePhone = '0399493924';
  String _validatePass = '123456';
  @override
  void initState() {
    _showPass = true;
    _showRePass = true;
    super.initState();
    _passwordController.addListener(() {
      final String text = _passwordController.text.toLowerCase();
      _passwordController.value = _passwordController.value.copyWith(
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
    _passwordController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "New Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                  label: "New-Password",
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
                  //   suffixIcon: _showPass ? Icons.visibility : Icons.visibility_off,
                  //   suffixPress: () => {
                  //     setState(() {
                  //       _showPass = !_showPass;
                  //     }),
                  //   },
                  controller: _passwordController,
                  obscureText: _showPass,
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
                      icon: Icon(_showPass ? Icons.visibility : Icons.visibility_off),
                      iconSize: 20,
                      highlightColor: Colors.amber,
                    ),
                    // suffixIcon: _showRePass ? Icons.visibility : Icons.visibility_off,
                    // suffixPress: () => {
                    //   setState(() {
                    //     _showRePass = !_showRePass;
                    //   }),
                    // },
                    controller: _passController,
                  )),
              SizedBox(height: Responsive.scale(30, context)),
              RoundedButton(
                title: "Tiếp theo",
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
                  //   if (_passwordController.text.compareTo(_validatePhone) == 0 &&
                  //       _passController.text.compareTo(_validatePass) == 0) {
                  Navigator.pushNamed(context, Routes.homeScreen);
                  //   } else {
                  //     Toast(
                  //       context,
                  //       errorMessage: "Số điện thoại hoặc mật khẩu không đúng",
                  //       errorCode: 404,
                  //       type: AppError.error,
                  //     ).showToast();
                  //   }
                  // ignore: avoid_print
                  //   if (_passwordController.value == _validatePhone && _passController.value == _validatePass) {
                  //     Navigator.pushNamed(context, Routes.homeScreen);
                  //   } else {}
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

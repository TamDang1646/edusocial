import 'package:flutter/material.dart';
import 'package:my_app/constains/app_constaint.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/routes/screen_stack.dart';
import 'package:my_app/utils/app_utils.dart';
import 'package:my_app/widgets/flash_message/flash_message.dart';
import '../../constains/images.dart';
import '../../widgets/button/button-custom.dart';
import '../../widgets/text_input/text-field-input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _sdtController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
//   String _sdtText = "";
//   String _passText = "";
  late bool _showPass;
  String _validatePhone = '0399493924';
  String _validatePass = '123456';
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
                  suffixIcon: Icon(Icons.phone),
                  controller: _sdtController,
                  //   onChange: (text) => {
                  //     setState(() {
                  //       _sdtText = text;
                  //     })
                  //   },
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
                    // suffixIcon: _showPass ? Icons.visibility : Icons.visibility_off,
                    // suffixPress: () => {
                    //   setState(() {
                    //     _showPass = !_showPass;
                    //   }),
                    // },
                    controller: _passController,
                    // onChange: (text) => {
                    //   setState(() {
                    //     _passText = text;
                    //   })
                    // },
                  )),
              SizedBox(height: Responsive.scale(30, context)),
              RoundedButton(
                title: "Sign in",
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
                  if (_sdtController.text.compareTo(_validatePhone) == 0 &&
                      _passController.text.compareTo(_validatePass) == 0) {
                    Navigator.pushNamed(context, Routes.homeScreen);
                  } else {
                    Toast(
                      context,
                      errorMessage: "Số điện thoại hoặc mật khẩu không đúng",
                      errorCode: 404,
                      type: AppError.error,
                    ).showToast();
                  }
                  // ignore: avoid_print
                  //   if (_sdtController.value == _validatePhone && _passController.value == _validatePass) {
                  //     Navigator.pushNamed(context, Routes.homeScreen);
                  //   } else {}
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Chưa có tài khoản."),
                      TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print("register");
                          Navigator.pushNamed(context, Routes.otpScreen);
                        },
                        child: const Text("Đăng ký ngay"),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        //   Navigator.push(builder: MainStack(context).stackScreen);
                        // ignore: avoid_print
                        print("register");
                        Navigator.pushNamed(context, Routes.otpScreen);
                      },
                      child: const Text("Quên mật khẩu"))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

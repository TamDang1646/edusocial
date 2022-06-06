import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/constains/app_constaint.dart';
import 'package:my_app/widgets/flash_message/flash_message.dart';

import '../../constains/images.dart';
import '../../routes/routes.dart';
import '../../utils/app_utils.dart';
import '../../widgets/button/button-custom.dart';
import '../../widgets/text_input/text-field-input.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _sdtController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
//   String _sdtText = "";
//   String _passText = "";
  late bool _showPass;
  String _validatePhone = '0399493924';
  String _validateOTP = '123456';
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
    _otpController.addListener(() {
      final String text = _otpController.text.toLowerCase();
      _otpController.value = _otpController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _sdtController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "OTP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.logo),
          SizedBox(
            height: Responsive.scale(50, context),
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
                  //   onChange: (text) => {
                  //     setState(() {
                  //       _sdtText = text;
                  //     })
                  //   },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Container(
                      width: 150,
                      child: TextInputCustom(
                        label: "OTP",
                        controller: _otpController,
                        width: Responsive.scale(200, context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: TextButton(
                      child: const Text("Send OTP"),
                      onPressed: () {
                        if (_sdtController.text.isEmpty) {
                          Toast(
                            context,
                            errorMessage: "Số điện thoại không được để trống",
                            errorCode: 100,
                            type: AppError.error,
                          ).showToast();
                        } else {
                          print("sent OTP");
                        }
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: Responsive.scale(50, context)),
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
                  //   if (_sdtController.text.compareTo(_validatePhone) == 0 &&
                  //       _otpController.text.compareTo(_validateOTP) == 0) {
                  //     Navigator.pushNamed(context, Routes.homeScreen);
                  //   } else {
                  //     Toast(
                  //       context,
                  //       errorMessage: "Số điện thoại hoặc mật khẩu không đúng",
                  //       errorCode: 404,
                  //       type: AppError.error,
                  //     ).showToast();
                  //   }
                  // ignore: avoid_print
                  //   if (_sdtController.value == _validatePhone && _otpController.value == _validateOTP) {
                  //     Navigator.pushNamed(context, Routes.homeScreen);
                  //   } else {}
                  Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                },
              ),
              SizedBox(
                height: Responsive.scale(50, context),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/constains/app_constaint.dart';
import 'package:my_app/screens/main_screen/main_screen.dart';
import 'package:my_app/widgets/text_input/text-field-input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constains/images.dart';
import '../../utils/app_utils.dart';
import '../../widgets/button/button-custom.dart';
import '../../widgets/flash_message/flash_message.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController _sdtController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  late bool _showPass;
  late String sdt = "0399493924";
  String currentText = "";
  @override
  void initState() {
    _sdtController.addListener(() {
      final String text = _sdtController.text.toLowerCase();
      _sdtController.value = _sdtController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _showPass = true;
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void complete() {
    print("next $currentText");
    if (currentText == "123456") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => const MainScreen()),
        (route) => false,
      );
    } else {
      Toast(
        context,
        errorCode: 1,
        errorMessage: "OTP isn't valid",
        type: ErrorType.error,
      ).showToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      sdt = (ModalRoute.of(context)!.settings.arguments as OtpState).sdt!;
    } catch (e) {
      print(e);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        // title: const Text(
        //   "OTP",
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Image.asset(Images.logo)),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  const Text(
                    "Phone Number Verification",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (!sdt.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Số Điện Thoại Nhận OTP"),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              TextInputCustom(
                                width: 270,
                                controller: _sdtController,
                                hintLabel: "Nhập SDT",
                                //   width: MediaQuery.of(context).size.width - 64,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Send",
                                    style: TextStyle(fontSize: 16),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )
                  else
                    RichText(
                      text: TextSpan(
                        text: "Enter the code sent to: ",
                        style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: sdt,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveColor: Colors.grey.withOpacity(0.6),
                      ),
                      // animationDuration: const Duration(milliseconds: 200),
                      enableActiveFill: false,
                      errorAnimationController: errorController,
                      controller: textEditingController,

                      validator: (v) {
                        if (v!.length < 6) {
                          return "Input all field";
                        } else {
                          return null;
                        }
                      },
                      onCompleted: (v) {
                        complete();
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      onSubmitted: (value) {
                        print(value);
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Didn't receive the code?"),
                      TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print("register");
                        },
                        child: const Text("RESEND"),
                      ),
                    ],
                  ),
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(builder: (BuildContext context) => const MainScreen()),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(
                    height: Responsive.scale(50, context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpState {
  final String? sdt;
  const OtpState({this.sdt}) : super();
}

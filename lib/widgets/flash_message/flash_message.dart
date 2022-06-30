import 'package:edusocial/constains/app_constaint.dart';
import 'package:edusocial/utils/app_utils.dart';
import 'package:flutter/material.dart';

class Toast {
  const Toast(
    this.context, {
    required this.errorMessage,
    required this.errorCode,
    required this.type,
    this.duration = 2,
  });
  final BuildContext context;
  final String errorMessage;
  final int type;
  final int duration;
  final int errorCode;
  void showToast() {
    final scaffold = ScaffoldMessenger.of(context);
    Map flashStyle = {
      "backgroundColor": type == ErrorType.error
          ? const Color.fromARGB(255, 244, 70, 70)
          : type == ErrorType.success
              ? const Color.fromARGB(255, 1, 136, 3)
              : const Color.fromARGB(255, 171, 184, 1),
    };
    scaffold.showSnackBar(
      SnackBar(
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: duration),
          elevation: 0,
          content: Container(
            constraints: BoxConstraints(
              maxHeight: Responsive.scale(90, context),
              minHeight: Responsive.scale(10, context),
              minWidth: Responsive.scale(300, context),
              maxWidth: Responsive.scale(MediaQuery.of(context).size.width - 32, context),
            ),
            // height: Responsive.scale(70, context),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: flashStyle["backgroundColor"],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Responsive.scale(8, context),
                ),
              ),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ERROR: $errorMessage",
                    style: TextStyle(
                      fontSize: Responsive.scale(13, context),
                      color: Colors.white,
                      //   backgroundColor: Colors.yellow,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (type == ErrorType.error)
                    Text(
                      "ERROR_CODE: $errorCode",
                      style: TextStyle(fontSize: Responsive.scale(11, context), color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          )
          //   action: SnackBarAction()
          ),
    );
  }
}

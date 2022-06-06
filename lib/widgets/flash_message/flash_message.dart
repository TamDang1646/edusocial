import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/constains/app_constaint.dart';
import 'package:my_app/utils/app_utils.dart';
import 'package:my_app/constains/app_constaint.dart';

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
  @override
  void showToast() {
    final scaffold = ScaffoldMessenger.of(context);
    Map flashStyle = {
      "backgroundColor": type == AppError.error
          ? const Color.fromARGB(255, 244, 70, 70)
          : type == AppError.success
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ERROR: $errorMessage",
                  style: TextStyle(
                    fontSize: Responsive.scale(12, context),
                    color: Colors.white,
                    //   backgroundColor: Colors.yellow,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                if (type == AppError.error)
                  Text(
                    "ERROR_CODE: $errorCode",
                    style: TextStyle(fontSize: Responsive.scale(11, context), color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          )
          //   action: SnackBarAction()
          ),
    );
  }
}
// Container(
//             height: Responsive.scale(50, context),
//             decoration: const BoxDecoration(color: Colors.transparent),
//             child: Column(
//               children: [
//                 Container(
//                   //   padding: EdgeInsets.all(Responsive.scale(16, context)),
//                   height: Responsive.scale(50, context),
//                   //   width: Responsive.scale(385, context),
//                   decoration: BoxDecoration(
//                     color: flashStyle["backgroundColor"],
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(
//                         Responsive.scale(8, context),
//                       ),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       //   SizedBox(width: Responsive.scale(48, context)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: Responsive.scale(8, context), vertical: Responsive.scale(4, context)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             if (type == AppError.error)
//                               Expanded(
//                                 flex: 1,
//                                 child: Text(
//                                   "ERROR_CODE: $errorCode",
//                                   style: TextStyle(fontSize: Responsive.scale(11, context), color: Colors.white),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             Expanded(
//                               flex: 2,
//                               child: Text(
//                                 errorMessage,
//                                 style: TextStyle(
//                                   fontSize: Responsive.scale(12, context),
//                                   color: Color.fromARGB(255, 49, 48, 48),
//                                   //   backgroundColor: Colors.yellow,
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),

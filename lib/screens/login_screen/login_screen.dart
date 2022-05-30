import 'package:flutter/material.dart';
import 'package:my_app/components/style.dart';
import 'package:my_app/utils/app_utils.dart';
import '../../components/tabbar-custom.dart';
import '../../constains/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //   Container(
          //     decoration: BoxDecoration(border: Border.all(width: 1)),
          //     height: Responsive.scale(20, context),
          //   ),
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
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: TextFormField(
                      decoration: Style.textFieldStyle(labelTextStr: "Password", borderRadiusCircular: 8),
                      obscureText: true,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

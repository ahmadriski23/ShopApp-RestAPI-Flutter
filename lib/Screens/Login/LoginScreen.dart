import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Login/LoginForm.dart';

import '../../Components/Login/LoginComponent.dart';
import '../../utils/constant.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: LoginComponent(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Login/LoginForm.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SignInForm(),
        ),
      ),
    );
  }
}

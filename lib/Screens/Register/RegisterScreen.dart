import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Register/RegistrasiComponent.dart';

import '../../Components/Register/RegistrasiForm.dart';
import '../../utils/constant.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegistrasiComponent(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Register/RegistrasiForm.dart';

class RegistrasiComponent extends StatefulWidget {
  const RegistrasiComponent({super.key});

  @override
  State<RegistrasiComponent> createState() => _RegistrasiComponentState();
}

class _RegistrasiComponentState extends State<RegistrasiComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SignUpForm(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'FormTransaksiComponent.dart';

class TransaksiComponent extends StatefulWidget {
  const TransaksiComponent({super.key});

  @override
  State<TransaksiComponent> createState() => _TransaksiComponentState();
}

class _TransaksiComponentState extends State<TransaksiComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: TransaksiForm(),
        ),
      ),
    );
  }
}

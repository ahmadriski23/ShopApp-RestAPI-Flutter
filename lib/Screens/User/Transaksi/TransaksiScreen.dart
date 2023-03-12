import 'package:flutter/material.dart';

import '../../../Components/User/Transaksi/CreateTransaksi/TransaksiComponents.dart';
import '../../../utils/constant.dart';

class TransaksiScreen extends StatelessWidget {
  static String routeName = "/form_transaksi_screen";
  static var dataGitar;

  const TransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dataGitar = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Menu Transaksi",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left, color: Colors.black)),
      ),
      body: TransaksiComponent(),
    );
  }
}

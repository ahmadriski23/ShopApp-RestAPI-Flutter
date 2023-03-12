import 'package:flutter/material.dart';

import '../../../Components/User/Transaksi/CreateTransaksi/TransaksiComponents.dart';
import '../../../Components/User/Transaksi/DataTransaksi/DataTransaksiUserComponent.dart';
import '../../../utils/constant.dart';

class DataTransaksiScreen extends StatelessWidget {
  static var routeName = "/data_transaksi_screen";

  const DataTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Data Transaksi",
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
      body: DataTransaksiUserComponent(),
    );
  }
}

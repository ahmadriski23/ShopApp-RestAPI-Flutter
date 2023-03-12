import 'package:flutter/material.dart';

import '../../../Components/Admin/CRUD/InputProduk/InputProdukComponent.dart';

class InputProdukScreen extends StatelessWidget {
  static String routeName = "/input_produk_screen";

  const InputProdukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Input Data Produk",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: InputProdukComponent(),
    );
  }
}

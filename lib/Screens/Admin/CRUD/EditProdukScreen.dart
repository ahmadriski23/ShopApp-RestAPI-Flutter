import 'package:flutter/material.dart';

import '../../../Components/Admin/CRUD/EditProduk/EditProdukComponent.dart';
import '../../../Components/Admin/CRUD/InputProduk/InputProdukComponent.dart';

class EditProdukScreen extends StatelessWidget {
  static String routeName = "/edit_produk_screen";
  static var dataGitar;

  const EditProdukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dataGitar = ModalRoute.of(context)!.settings.arguments as Map;

    print(dataGitar);
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
          "Edit Data Produk",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: EditProdukComponent(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../Components/User/Produk/ProdukComponent.dart';
import '../../../utils/constant.dart';

class DataProdukScreen extends StatelessWidget {
  static var routeName = '/list_gitar_user_screen';
  const DataProdukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Daftar Produk",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black)),
      ),
      body: ProdukComponent(),
    );
  }
}

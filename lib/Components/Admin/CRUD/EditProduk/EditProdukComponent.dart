import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Login/LoginForm.dart';

import 'EditProdukForm.dart';

class EditProdukComponent extends StatefulWidget {
  const EditProdukComponent({super.key});

  @override
  State<EditProdukComponent> createState() => _EditProdukComponentState();
}

class _EditProdukComponentState extends State<EditProdukComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text("Edit Data Produk !"),
              ),
              FormEditProduk(),
            ],
          ),
        ),
      ),
    );
  }
}

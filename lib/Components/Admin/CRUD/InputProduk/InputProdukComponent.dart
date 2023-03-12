import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Admin/CRUD/InputProduk/InputProdukForm.dart';
import 'package:toko_gitar_flutter/Components/Login/LoginForm.dart';

class InputProdukComponent extends StatefulWidget {
  const InputProdukComponent({super.key});

  @override
  State<InputProdukComponent> createState() => _InputProdukComponentState();
}

class _InputProdukComponentState extends State<InputProdukComponent> {
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
                child: Text("Input Data Produk !"),
              ),
              FormInputProduk(),
            ],
          ),
        ),
      ),
    );
  }
}

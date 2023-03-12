import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Admin/CRUD/InputProduk/InputProdukForm.dart';
import 'package:toko_gitar_flutter/Components/Login/LoginForm.dart';

import 'UploadBuktiBayarForm.dart';

class UploadPembayaranComponent extends StatefulWidget {
  const UploadPembayaranComponent({super.key});

  @override
  State<UploadPembayaranComponent> createState() =>
      _UploadPembayaranComponentState();
}

class _UploadPembayaranComponentState extends State<UploadPembayaranComponent> {
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
                child: Text("Upload Bukti Pembayaran Mu !"),
              ),
              FormUploadPembayaran(),
            ],
          ),
        ),
      ),
    );
  }
}

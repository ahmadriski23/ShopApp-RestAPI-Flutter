import 'package:flutter/material.dart';

import '../../../Components/User/Transaksi/CreateTransaksi/TransaksiComponents.dart';
import '../../../Components/User/Transaksi/UploadBuktiPembayaran/UploadBuktiBayarComponent.dart';

class UploadBuktiPembayaranScreen extends StatelessWidget {
  static String routeName = "/upload_butki_pembayaran";
  static var dataTransaksi;

  const UploadBuktiPembayaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dataTransaksi = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Upload Bukti Pembayaran",
          style: TextStyle(
            color: Color.fromARGB(255, 153, 38, 174),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left, color: Colors.black)),
      ),
      body: UploadPembayaranComponent(),
    );
  }
}

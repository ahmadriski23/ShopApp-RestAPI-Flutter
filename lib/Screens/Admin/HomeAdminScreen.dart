import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Admin/HomeAdminComponents.dart';
import 'package:toko_gitar_flutter/Screens/Login/LoginScreen.dart';

import '../../utils/constant.dart';
import 'CRUD/InputProdukScreen.dart';

class HomeAdminScreen extends StatelessWidget {
  static String routeName = "/admin_screen";

  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Ki Apps",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.home, color: Colors.black),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InputProdukScreen.routeName);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                Text(
                  "Input Data",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: HomeAdminComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Peringatan',
              desc: 'Yakin ingin logout?',
              btnCancelOnPress: () {},
              btnCancelText: 'Tidak',
              btnOkText: 'Yakin',
              btnOkOnPress: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              }).show();
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}

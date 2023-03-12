import 'package:flutter/material.dart';

import '../../Components/User/HomeUserComponent.dart';
import '../../utils/constant.dart';

class HomeUserScreen extends StatelessWidget {
  static String routeName = "/home_screen";
  static var dataUserLogin;

  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dataUserLogin = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Ki Apps",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.home, color: Colors.black),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: HomeUserComponent(),
    );
  }
}

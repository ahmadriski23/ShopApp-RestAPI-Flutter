import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Screens/Login/LoginScreen.dart';
import 'package:toko_gitar_flutter/routes.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Toko Gitar Keren",
    theme: ThemeData(),
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
}

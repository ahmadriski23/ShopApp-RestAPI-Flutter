import 'package:flutter/cupertino.dart';
import 'package:toko_gitar_flutter/Screens/Admin/CRUD/InputProdukScreen.dart';
import 'package:toko_gitar_flutter/Screens/Admin/HomeAdminScreen.dart';

import 'package:toko_gitar_flutter/Screens/Login/LoginScreen.dart';
import 'package:toko_gitar_flutter/Screens/Register/RegisterScreen.dart';

import 'Screens/Admin/CRUD/EditProdukScreen.dart';
import 'Screens/User/HomeUserScreen.dart';
import 'Screens/User/Produk/DataProdukScreen.dart';
import 'Screens/User/Transaksi/DataTransaksiUser.dart';
import 'Screens/User/Transaksi/TransaksiScreen.dart';
import 'Screens/User/Transaksi/UploadBuktiBayar.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeUserScreen.routeName: (context) => HomeUserScreen(),
  HomeAdminScreen.routeName: (context) => HomeAdminScreen(),
  InputProdukScreen.routeName: (context) => InputProdukScreen(),
  EditProdukScreen.routeName: (context) => EditProdukScreen(),
  DataProdukScreen.routeName: (context) => DataProdukScreen(),
  DataProdukScreen.routeName: (context) => DataProdukScreen(),
  TransaksiScreen.routeName: (context) => TransaksiScreen(),
  DataTransaksiScreen.routeName: (context) => DataTransaksiScreen(),
  UploadBuktiPembayaranScreen.routeName: (context) =>
      UploadBuktiPembayaranScreen(),
};

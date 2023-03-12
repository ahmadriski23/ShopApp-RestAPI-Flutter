import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Screens/Register/RegisterScreen.dart';
import 'package:dio/dio.dart';

import '../../API/configAPI.dart';
import '../../Screens/Admin/HomeAdminScreen.dart';
import '../../Screens/User/HomeUserScreen.dart';
import '../../utils/constant.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  String? username;
  String? password;
  bool? remeber = false;

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();
  FocusNode focusNode = new FocusNode();

  Response? response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Icon(
                Icons.supervised_user_circle,
                color: kPrimaryColor,
                size: 150,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            buildUserName(),
            SizedBox(
              height: 50,
            ),
            buildPassword(),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Checkbox(
                    value: remeber,
                    onChanged: (value) {
                      setState(() {
                        remeber = value;
                      });
                    }),
                Text(
                  'Tetap Masuk',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Lupa Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                prosesLogin(txtUserName.text, txtPassword.text);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              child: Text(
                'Belum Punya Akun ? Daftar Disini',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUserName,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukkan username anda',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? kPrimaryColor : kSecondColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.people),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondColor),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
        ),
        labelText: 'Password',
        hintText: 'Masukkan password anda',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? kPrimaryColor : kSecondColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondColor),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }

  void prosesLogin(userName, password) async {
    UtilsApps.showDialog(context);

    bool status;
    var msg;
    var dataUser;

    try {
      response = await dio.post(urlLogin, data: {
        'username': userName,
        'password': password,
      });

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Berhasil Login',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
            dataUser = response!.data['data'];
            if (dataUser['role'] == 1) {
              Navigator.pushNamed(context, HomeUserScreen.routeName,
                  arguments: dataUser);
            } else if (dataUser['role'] == 2) {
              Navigator.pushNamed(context, HomeAdminScreen.routeName);
            } else {
              print("Halaman tidak tersedia");
            }
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Gagal Login => $msg',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
          },
        ).show();
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Peringatan',
        desc: 'Terjadi Kesalahan Pada Server',
        btnOkOnPress: () {
          UtilsApps.hideDialog(context);
        },
      ).show();
    }
  }
}

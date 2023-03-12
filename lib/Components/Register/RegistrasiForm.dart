import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Register/RegistrasiComponent.dart';

import '../../API/configAPI.dart';
import '../../Screens/Login/LoginScreen.dart';
import '../../utils/constant.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String? username;
  String? password;
  String? namaLengkap;
  String? email;
  bool? remeber = false;

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController(),
      txtNamaLengkap = TextEditingController(),
      txtEmail = TextEditingController();
  FocusNode focusNode = new FocusNode();

  Response? response;
  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                Icons.recommend_rounded,
                color: kPrimaryColor,
                size: 150,
              ),
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            buildNamaLengkap(),
            SizedBox(
              height: 50,
            ),
            buildUserName(),
            SizedBox(
              height: 50,
            ),
            buildEmail(),
            SizedBox(
              height: 50,
            ),
            buildPassword(),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                prosesRegistrasi(txtUserName.text, txtPassword.text,
                    txtNamaLengkap.text, txtEmail.text);
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
                    "Registrasi",
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
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text(
                'Sudah Punya Akun ? Masuk',
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondColor),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
        ),
        labelText: 'Username',
        hintText: 'Masukkan username anda',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? kPrimaryColor : kSecondColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.people),
      ),
    );
  }

  TextFormField buildNamaLengkap() {
    return TextFormField(
      controller: txtNamaLengkap,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondColor),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
        ),
        labelText: 'Nama Lengkap',
        hintText: 'Masukkan nama lengkap anda',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? kPrimaryColor : kSecondColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.abc),
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondColor),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
        ),
        labelText: 'Email',
        hintText: 'Masukkan Email anda',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? kPrimaryColor : kSecondColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email),
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondColor),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          borderSide: BorderSide(width: 2, color: kPrimaryColor),
        ),
        labelText: 'Password',
        hintText: 'Masukkan password anda',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? kPrimaryColor : kSecondColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  void prosesRegistrasi(userName, password, nama, email) async {
    UtilsApps.showDialog(context);

    bool status;
    var msg;

    try {
      response = await dio.post(urlRegister, data: {
        'username': userName,
        'password': password,
        'nama': nama,
        'email': email,
      });

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Berhasil Registrasi',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Gagal Registrasi => $msg',
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

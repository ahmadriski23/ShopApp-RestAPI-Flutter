import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toko_gitar_flutter/Screens/Register/RegisterScreen.dart';
import 'package:dio/dio.dart';
import 'package:toko_gitar_flutter/utils/constant.dart';

import '../../../../API/configAPI.dart';
import '../../../../Screens/Admin/HomeAdminScreen.dart';

class FormInputProduk extends StatefulWidget {
  @override
  _FormInputProduk createState() => _FormInputProduk();
}

class _FormInputProduk extends State<FormInputProduk> {
  TextEditingController txtNamaProduk = TextEditingController(),
      txtTipeProduk = TextEditingController(),
      txtHargaProduk = TextEditingController(),
      txtMerekProduk = TextEditingController();

  FocusNode focusNode = new FocusNode();
  File? image;

  Response? response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            buildNamaProduk(),
            SizedBox(
              height: 50,
            ),
            buildTipeProduk(),
            SizedBox(
              height: 50,
            ),
            buildHargaProduk(),
            SizedBox(
              height: 50,
            ),
            buildMerekProduk(),
            SizedBox(
              height: 50,
            ),
            image == null
                ? Container()
                : Image.file(
                    image!,
                    // width: 250,
                    // height: 250,
                    fit: BoxFit.cover,
                  ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 153, 38, 174),
                  foregroundColor: Color.fromARGB(255, 153, 38, 174),
                ),
                onPressed: () {
                  pilihGambar();
                },
                child: Text(
                  'Pilih Gambar Produk',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 153, 38, 174),
                  foregroundColor: Color.fromARGB(255, 153, 38, 174),
                ),
                onPressed: () {
                  if (txtNamaProduk.text == '') {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Peringatan',
                        desc: 'Nama Produk Tidak Boleh Kosong',
                        btnOkOnPress: () {
                          UtilsApps.hideDialog(context);
                        }).show();
                  } else if (txtTipeProduk.text == '') {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Peringatan',
                        desc: 'Tipe Produk Tidak Boleh Kosong',
                        btnOkOnPress: () {
                          UtilsApps.hideDialog(context);
                        }).show();
                  } else if (txtHargaProduk.text == '') {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Peringatan',
                        desc: 'Harga Produk Tidak Boleh Kosong',
                        btnOkOnPress: () {
                          UtilsApps.hideDialog(context);
                        }).show();
                  } else if (txtMerekProduk.text == '') {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Peringatan',
                        desc: 'Merek Produk Tidak Boleh Kosong',
                        btnOkOnPress: () {
                          UtilsApps.hideDialog(context);
                        }).show();
                  } else {
                    inputDataGitar(txtNamaProduk.text, txtTipeProduk.text,
                        txtHargaProduk.text, txtMerekProduk.text, image?.path);
                  }
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildNamaProduk() {
    return TextFormField(
      controller: txtNamaProduk,
      decoration: InputDecoration(
        labelText: 'Nama Produk',
        hintText: 'Masukkan nama produk',
        labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? Color.fromARGB(255, 153, 38, 174)
                : Colors.pink),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.shopping_bag),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.yellow),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(width: 2, color: Colors.yellow),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.pink),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  TextFormField buildTipeProduk() {
    return TextFormField(
      controller: txtTipeProduk,
      decoration: InputDecoration(
        labelText: 'Tipe Produk',
        hintText: 'Masukkan tipe produk',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? Colors.yellow : Colors.pink),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.shopping_bag),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.yellow),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(width: 2, color: Colors.yellow),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.pink),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  TextFormField buildHargaProduk() {
    return TextFormField(
      controller: txtHargaProduk,
      decoration: InputDecoration(
        labelText: 'Harga Produk',
        hintText: 'Masukkan harga produk',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? Colors.yellow : Colors.pink),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.shopping_bag),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.yellow),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(width: 2, color: Colors.yellow),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.pink),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  TextFormField buildMerekProduk() {
    return TextFormField(
      controller: txtMerekProduk,
      decoration: InputDecoration(
        labelText: 'Merek Produk',
        hintText: 'Masukkan merek produk',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? Colors.yellow : Colors.pink),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.shopping_bag),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.yellow),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(width: 2, color: Colors.yellow),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.pink),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Future pilihGambar() async {
    try {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Gagal mengambil foto : $e");
    }
  }

  void inputDataGitar(nama, tipe, harga, merk, gambar) async {
    UtilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      var formData = FormData.fromMap({
        'nama': nama,
        'tipe': tipe,
        'harga': harga,
        'merk': merk,
        'gambar': await MultipartFile.fromFile(gambar)
      });

      response = await dio.post(inputGitar, data: formData);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              UtilsApps.hideDialog(context);
              Navigator.pushNamed(context, HomeAdminScreen.routeName);
            }).show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              UtilsApps.hideDialog(context);
            }).show();
      }
    } catch (e) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Terjadi Kesalahan Pada Server Kami',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
          }).show();
    }
  }
}

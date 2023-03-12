import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:toko_gitar_flutter/Screens/User/Transaksi/UploadBuktiBayar.dart';
import 'package:toko_gitar_flutter/utils/constant.dart';

import '../../../../API/configAPI.dart';
import '../../../../Screens/Admin/HomeAdminScreen.dart';
import '../../../../Screens/User/HomeUserScreen.dart';

class FormUploadPembayaran extends StatefulWidget {
  @override
  _FormUploadPembayaran createState() => _FormUploadPembayaran();
}

class _FormUploadPembayaran extends State<FormUploadPembayaran> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  'Pilih Bukti Pembayaran Anda',
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
                  uploadBukti(image!.path);
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

  void uploadBukti(gambar) async {
    UtilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      var formData = FormData.fromMap(
          {'buktiPembayaran': await MultipartFile.fromFile(gambar)});

      response = await dio.put(
          '$uploadBuktiPembayaranBarang/${UploadBuktiPembayaranScreen.dataTransaksi['_id']}',
          data: formData);
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
              Navigator.pushNamed(context, HomeUserScreen.routeName,
                  arguments: HomeUserScreen.dataUserLogin);
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
      print(e);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Terjadi Kesalahan Pada Server Kami!!!!!!',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
          }).show();
    }
  }
}

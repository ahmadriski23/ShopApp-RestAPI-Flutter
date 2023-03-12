import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

import '../../../../API/configAPI.dart';
import '../../../../Screens/User/HomeUserScreen.dart';
import '../../../../Screens/User/Transaksi/TransaksiScreen.dart';
import '../../../../utils/constant.dart';

class TransaksiForm extends StatefulWidget {
  const TransaksiForm({super.key});

  @override
  State<TransaksiForm> createState() => _TransaksiFormState();
}

class _TransaksiFormState extends State<TransaksiForm> {
  var totalBayar = 0.0;
  var jumlahBeli = 0.0;
  var hargaBarang = TransaksiScreen.dataGitar['harga'];
  Response? response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    print(TransaksiScreen.dataGitar);
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Column(children: [
          Image.network(
            "$baseUrl/${TransaksiScreen.dataGitar['gambar']}",
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Barang",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${TransaksiScreen.dataGitar['nama']}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tipe",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${TransaksiScreen.dataGitar['tipe']}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harga",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp. ${TransaksiScreen.dataGitar['harga']}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Merk",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${TransaksiScreen.dataGitar['merk']}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah Beli",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: SpinBox(
              min: 1,
              max: 100,
              value: 0,
              onChanged: (value) {
                setState(() {
                  jumlahBeli = value;
                  totalBayar = jumlahBeli * hargaBarang;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp. $totalBayar",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              if (totalBayar <= 0 || jumlahBeli <= 0) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Jumlah Pembelian Minimal 1',
                  btnOkOnPress: () {},
                ).show();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc:
                      'Yakin Ingin Melakukan Pembelian Produk ${TransaksiScreen.dataGitar['nama']} ?',
                  btnOkText: 'Yakin',
                  btnCancelText: 'Batal',
                  btnOkOnPress: () {
                    prosesTransaksi(
                        TransaksiScreen.dataGitar['_id'],
                        HomeUserScreen.dataUserLogin['_id'],
                        jumlahBeli,
                        hargaBarang,
                        totalBayar);
                  },
                  btnCancelOnPress: () {},
                ).show();
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color.fromARGB(255, 237, 159, 43),
              ),
              child: Center(
                child: Text(
                  "Beli",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  void prosesTransaksi(idBarang, idUser, jumlah, harga, total) async {
    UtilsApps.showDialog(context);

    bool status;
    var msg;

    try {
      response = await dio.post(createTransaksi, data: {
        'idBarang': idBarang,
        'idUser': idUser,
        'jumlah': jumlah,
        'harga': harga,
        'total': total,
      });

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Berhasil Transaksi',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
            Navigator.pushNamed(context, HomeUserScreen.routeName,
                arguments: HomeUserScreen.dataUserLogin);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Gagal Transaksi => $msg',
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

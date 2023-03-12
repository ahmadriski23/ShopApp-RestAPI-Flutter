import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../API/configAPI.dart';
import '../../Screens/User/HomeUserScreen.dart';
import '../../Screens/User/Produk/DataProdukScreen.dart';
import '../../Screens/User/Transaksi/DataTransaksiUser.dart';
import '../../Screens/User/Transaksi/UploadBuktiBayar.dart';
import '../../utils/constant.dart';

class HomeUserComponent extends StatefulWidget {
  const HomeUserComponent({super.key});

  @override
  State<HomeUserComponent> createState() => _HomeUserComponentState();
}

class _HomeUserComponentState extends State<HomeUserComponent> {
  Response? response;
  var dio = Dio();
  var dataTransaksi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Layanan",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                menuLayanan(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Data Transaksi Anda",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:
                          dataTransaksi == null ? 0 : dataTransaksi.length,
                      itemBuilder: (BuildContext context, int index) {
                        return cardTransaksi(dataTransaksi[index]);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuLayanan() {
    return Container(
      height: 70,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DataProdukScreen.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.20), width: 1),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                              "https://cdn-icons-png.flaticon.com/32/2099/2099125.png"),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Gitar",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "List Data Gitar",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, DataTransaksiScreen.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 16),
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.20), width: 1),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                              "https://cdn-icons-png.flaticon.com/32/3187/3187040.png"),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Transaksi",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Data Transaksi",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardTransaksi(data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UploadBuktiPembayaranScreen.routeName,
            arguments: data);
      },
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Container(
                padding: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1, color: Colors.white24),
                  ),
                ),
                child:
                    Image.network('$baseUrl/${data['dataBarang']['gambar']}'),
              ),
              title: Text(
                "${data['dataBarang']['nama']}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Harga",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp.${data['harga']}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Jumlah Beli",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${data['jumlah']}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp.${data['total']}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    data['buktiPembayaran'] == null
                        ? Text(
                            "Pending",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            "Berhasil",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ]),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.black, size: 30),
            ),
          ),
        ),
      ),
    );
  }

  void getDataTransaksi() async {
    UtilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      response = await dio
          .get('$getTransaksiUserLimit/${HomeUserScreen.dataUserLogin['_id']}');

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          dataTransaksi = response!.data['data'];
          print(dataTransaksi);
        });
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
          desc: 'Terjadi Kesalahan Pada Server',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
          }).show();
    }
  }
}

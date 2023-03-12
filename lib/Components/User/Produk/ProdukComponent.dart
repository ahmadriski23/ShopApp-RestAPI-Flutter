import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../API/configAPI.dart';
import '../../../Screens/User/Transaksi/TransaksiScreen.dart';
import '../../../utils/constant.dart';

class ProdukComponent extends StatefulWidget {
  const ProdukComponent({super.key});

  @override
  State<ProdukComponent> createState() => _ProdukComponentState();
}

class _ProdukComponentState extends State<ProdukComponent> {
  Response? response;
  var dio = Dio();
  var dataGitar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataGitar();
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
                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dataGitar == null ? 0 : dataGitar.length,
                      itemBuilder: (BuildContext context, int index) {
                        return cardGitar(dataGitar[index]);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardGitar(data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TransaksiScreen.routeName,
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
                child: Image.network('$baseUrl/${data['gambar']}'),
              ),
              title: Text(
                "${data['nama']}",
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
                      "${data['merk']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${data['tipe']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp. ${data['harga']}",
                      style: TextStyle(
                        color: Colors.black,
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

  void getDataGitar() async {
    UtilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      response = await dio.get(getAllGitar);

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        setState(() {
          dataGitar = response!.data['data'];
          print(dataGitar);
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

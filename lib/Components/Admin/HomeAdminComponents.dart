import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/API/configAPI.dart';
import 'package:toko_gitar_flutter/Components/Admin/CRUD/InputProduk/InputProdukForm.dart';
import 'package:toko_gitar_flutter/Components/Login/LoginForm.dart';
import 'package:toko_gitar_flutter/Screens/Admin/HomeAdminScreen.dart';
import 'package:toko_gitar_flutter/utils/constant.dart';

import '../../Screens/Admin/CRUD/EditProdukScreen.dart';

class HomeAdminComponent extends StatefulWidget {
  const HomeAdminComponent({super.key});

  @override
  State<HomeAdminComponent> createState() => _HomeAdminComponentState();
}

class _HomeAdminComponentState extends State<HomeAdminComponent> {
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              // Tempat Card
              Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dataGitar == null ? 0 : dataGitar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cardDataGitar(dataGitar[index]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDataGitar(data) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 253, 253, 253)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditProdukScreen.routeName,
                      arguments: data);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Peringatan',
                      desc: 'Yakin Ingin Menghapus ${data['nama']} ? ',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        hapusDataGitar('${data['_id']}');
                      }).show();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Hapus",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 30,
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

  void hapusDataGitar(id) async {
    UtilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      response = await dio.delete('$hapusGitar/$id');

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
          desc: 'Terjadi Kesalahan Pada Server',
          btnOkOnPress: () {
            UtilsApps.hideDialog(context);
          }).show();
    }
  }
}

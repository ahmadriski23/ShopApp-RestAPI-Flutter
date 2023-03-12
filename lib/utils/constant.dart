import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog? pr;

class UtilsApps {
  static void showDialog(BuildContext context) {
    pr = new ProgressDialog(context);
    pr!.show();
  }

  static void hideDialog(BuildContext context) {
    pr = new ProgressDialog(context);
    pr!.hide();
  }
}

const Color kPrimaryColor = Color.fromARGB(255, 89, 252, 206);
const Color kSecondColor = Color.fromARGB(255, 105, 186, 251);

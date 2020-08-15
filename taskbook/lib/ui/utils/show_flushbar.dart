import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ShowFlushbar {
  static void showFlushbar(BuildContext context, String message, int time) {
    Flushbar(
      message: message,
      duration: Duration(milliseconds: time),
    )..show(context);
  }
}

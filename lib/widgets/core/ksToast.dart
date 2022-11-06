import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType {
  DEFAULT,
  SUCCESS,
  ERROR,
}

Map _mapColorType = {
  ToastType.DEFAULT: {
    'backgroundColor': const Color(0xFF1460A5),
    'textColor': Colors.white,
  },
  ToastType.SUCCESS: {
    'backgroundColor': const Color(0xFF006875),
    'textColor': Colors.white,
  },
  ToastType.ERROR: {
    'backgroundColor': const Color(0xFFBA1A1A),
    'textColor': Colors.white,
  },
};

class KsToast {
  static void show({
    required String message,
    ToastType type = ToastType.DEFAULT,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: _mapColorType[type]['backgroundColor'],
      textColor: _mapColorType[type]['textColor'],
      fontSize: 18.0,
    );
  }
}

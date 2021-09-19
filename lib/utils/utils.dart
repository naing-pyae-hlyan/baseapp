import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../localizations.dart';

class Utils {
  /// no connection code and message
  // ignore: constant_identifier_names
  static const NO_CONNECTION = 'No Internet Connection!';
  // ignore: constant_identifier_names
  static const CONNECTION_TIMEOUT = 'Connection timeout!';

  // ignore: constant_identifier_names
  static const NO_CONNECTION_CODE = '12029';
  // ignore: constant_identifier_names
  static const UN_AUTHENICATED = 'Unauthenticated.';
  // ignore: constant_identifier_names
  static const NO_CONNECTION_FOR_PENDING =
      'It seems that you don\'t have an Internet connection.\nPlease check your Internet connection and try again.';
  static final noConnectionForAttendance =
      'No Internet connection!\nThe attendance will be stored into your phone as pending submission.\nYou may submit the attendance later when you have Internet connection.'
          .lz;

  static var yMMMd =
      DateFormat.yMMMd('en_US').format(DateTime.now()).toString();
  static var yMMd = DateFormat.yMd().format(DateTime.now()).toString();
  static var yyyyMMdd =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
}

String addNewLine(String value) {
  if (value.isNotEmpty) {
    value += '\n';
  }
  return value;
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getSmallestScreenSize(BuildContext context) {
  final size = getScreenSize(context);
  return size.width < size.height ? size.width : size.height;
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return (!regex.hasMatch(value)) ? false : true;
}

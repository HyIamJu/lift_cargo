import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lift_cargo_control/shared/extenstions/string_extenstion.dart';

/// Examples of accepted strings:
///
/// * "2012-02-27"
/// * "2012-02-27 13:27:00"
/// * "2012-02-27 13:27:00.123456789z"
/// * "2012-02-27 13:27:00,123456789z"
/// * "20120227 13:27:00"
/// * "20120227T132700"
/// * "20120227"
/// * "+20120227"
/// * "2012-02-27T14Z"
/// * "2012-02-27T14+00:00"
/// * "-123450101 00:00:00 Z": in the year -12345.
/// * "2002-02-27T14:00:00-0500": Same as "2002-02-27T19:00:00Z"
///
/// * if not use above format, you have to parsing format in [fromFormat] by ur self.
/// * the function will parsing using intl
String formatDateString(String dateString,
    {String fromFormat = "",
    required String toFormat,
    String initialLocale = 'id',
    String outputLocale = "id"}) {
  try {
    // if (outputLocale.pureEmpty) {
    //   outputLocale = navigatorKey.currentContext?.locale.languageCode ?? "id";
    // }
    // if (initialLocale.pureEmpty) {
    //   initialLocale = navigatorKey.currentContext?.locale.languageCode ?? "id";
    // }

    // Parsing string ke DateTime menggunakan format input dan locale yang diberikan
    DateTime parsedDate;
    if (fromFormat.pureEmpty) {
      parsedDate = DateTime.parse(dateString);
    } else {
      parsedDate = DateFormat(fromFormat, initialLocale).parse(dateString);
    }

    // Memformat tanggal ke format yang diinginkan dengan outputLocale
    return DateFormat(toFormat, outputLocale).format(parsedDate);
  } catch (e) {
    // Jika parsing gagal, kembalikan string aslinya
    debugPrint(e.toString());
    return dateString;
  }
}

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lift_cargo_control/app.dart';

void main() async {
  await initializeDateFormatting('id', null);

  runApp(MyApp());
}

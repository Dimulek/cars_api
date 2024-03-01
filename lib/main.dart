import 'package:flutter/material.dart';
import 'package:cars_api/features/app.dart';
import 'package:cars_api/di/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
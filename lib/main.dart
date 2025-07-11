import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/stationlistpage.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(home: HomePage());
    return MaterialApp(home: StationlistPage());
  }
}

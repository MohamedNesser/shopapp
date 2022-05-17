import 'package:ShopApp/dio/Dio_halber.dart';
import 'package:ShopApp/firstscreen.dart';
import 'package:ShopApp/model/login_model.dart';
import 'package:ShopApp/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:ShopApp/sharedprefrances/shared_prafnsece.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Diohalper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: shoploginscreen(),
    );
  }
}



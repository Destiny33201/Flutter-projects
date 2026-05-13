import 'package:flutter/material.dart';
import 'package:flutter_application_2/Page/firstpage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  //init the hive
    WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();

    //open the box
    Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcalc/screens/home_screen.dart';
import 'package:xcalc/constants.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(XcalcApp());
}

class XcalcApp extends StatelessWidget {
  @ override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kTitle,
      theme: ThemeData(  
        scaffoldBackgroundColor: Colors.black87,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
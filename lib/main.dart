// @dart=2.9
import 'package:flutter/material.dart';
import 'package:book_dadyy/constants.dart';
import 'bottomnav.dart';
import 'loginScreen.dart';
import 'colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // ignore: prefer_const_constructors
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InitialScreen());
}

// ignore: use_key_in_widget_constructors
class InitialScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    const loginScreen = LoginScreen();
    return  MaterialApp(
      home: BottomNavBar(),
      title: appName,
        theme: ThemeData(
        fontFamily: 'Poppins',
        backgroundColor: KPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
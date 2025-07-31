import 'package:fitbot/age.dart';
import 'package:fitbot/bmi.dart';
import 'package:fitbot/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitbot/gender.dart';
import 'package:fitbot/splash.dart';
import 'package:fitbot/type.dart';
import 'package:fitbot/weightloss.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}

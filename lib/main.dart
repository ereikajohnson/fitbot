import 'package:fitbot/age.dart';
import 'package:fitbot/bmi.dart';
import 'package:fitbot/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitbot/gender.dart';
import 'package:fitbot/home.dart';
import 'package:fitbot/login.dart';
import 'package:fitbot/service.dart';
import 'package:fitbot/splash.dart';
import 'package:fitbot/type.dart';
import 'package:fitbot/weightloss.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}

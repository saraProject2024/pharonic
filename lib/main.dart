import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharonic/home/home.dart';
import 'package:pharonic/services/firebase_service.dart';
import 'package:pharonic/widget_tree.dart';

import 'started.dart';

// Import the generated file
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.pageId: (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      home: const WidgetTree(),
      // home: Home(),
    );
  }
}

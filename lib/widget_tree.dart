import 'package:flutter/material.dart';
import 'package:pharonic/home/home.dart';

import 'auth.dart';
import 'dart:developer' as logger;
import 'started.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          logger.log(snapshot.data.toString());
          if (snapshot.hasData) {
            return Home();
          } else {
            return const Started();
          }
        });
  }
}

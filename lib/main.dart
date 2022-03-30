import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task2_app/di/di.dart';
import 'package:task2_app/pages/main/main_page.dart';

void main() {
  runZonedGuarded(
    () async {
      await setup();
      runApp(const MyApp());
    },
    (error, stack) {
      //insert crash analytics
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

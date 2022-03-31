import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task2_app/data/utils/theme.dart';
import 'package:task2_app/di/di.dart';
import 'package:task2_app/pages/main/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runZonedGuarded(
    () => runApp(const MyApp()),
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
      title: 'Task2',
      debugShowCheckedModeBanner: false,
      theme: MyThemes.light(),
      darkTheme: MyThemes.dark(),
      home: const MainPage(),
    );
  }
}

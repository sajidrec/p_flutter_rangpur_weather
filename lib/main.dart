import 'package:flutter/material.dart';
import 'package:rangpur_weather/platform_related_stuffs/scroll_behavior.dart';
import 'package:rangpur_weather/screens/home_page.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rangpur Weather",
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

import 'dart:convert';
import 'package:chatbot/splash.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ChatBotPage.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: splash(),
      color: Colors.red,
      debugShowCheckedModeBanner: false,
    );
  }
}





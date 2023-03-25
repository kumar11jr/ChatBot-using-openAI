import 'dart:async';

import 'package:flutter/material.dart';

import 'ChatBotPage.dart';
import 'main.dart';

class splash extends StatefulWidget{
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash>{
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black26,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            child: Text("ChatAI",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
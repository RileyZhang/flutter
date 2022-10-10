import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class test0Page extends StatefulWidget{
  @override
  test0State createState()=>test0State();
}

class test0State extends State<test0Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test0"),
      ),
      body: Container(
        child: const BrnBubbleText(
          maxLines: 3,
          text: 'I am first bubble text',
        ),
      ),
    );
  }

}
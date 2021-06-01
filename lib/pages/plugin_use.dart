import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PluginUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'plugin 使用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('plugin 使用'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: HexColor('#9c9c9c')),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              '我是小王',
              style: TextStyle(color: HexColor('#ffffff'), fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

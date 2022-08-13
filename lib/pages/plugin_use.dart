import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PluginUsePage extends StatelessWidget {
  const PluginUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('plugin 使用'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
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
    );
  }
}

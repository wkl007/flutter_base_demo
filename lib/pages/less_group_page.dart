import 'package:flutter/material.dart';

/// StatelessWidget与基础组件
class StateLessGroupPage extends StatelessWidget {
  const StateLessGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 24, color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StatelessWidget 与基础组件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              '我是小王',
              style: textStyle,
            ),
            const Icon(
              Icons.android,
              size: 50,
              color: Colors.red,
            ),
            const CloseButton(),
            const BackButton(),
            const Chip(
              avatar: Icon(Icons.people),
              label: Text('老王爱小王'),
            ),
            const Divider(
              height: 10, // 容器高度，不是线的高度
              indent: 10, // 左侧间距
              color: Colors.orange,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text('This is a Card', style: textStyle),
              ),
            ),
            const AlertDialog(
              title: Text('干他'),
              content: Text('你这个糟老头子坏得很！！！'),
            ),
          ],
        ),
      ),
    );
  }
}

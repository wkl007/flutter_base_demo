import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导入和使用Flutter的资源文件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image(
              image:AssetImage('assets/images/avatar.jpg'),
              width: 500,
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}

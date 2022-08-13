import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导入和使用Flutter的资源文件'),
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
          children: const [
            Image(
              image: AssetImage('assets/images/avatar.jpg'),
              width: 500,
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}

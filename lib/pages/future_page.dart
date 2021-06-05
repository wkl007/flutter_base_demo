import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base_demo/pages/http_page.dart';
import 'package:http/http.dart' as http;

var url = Uri.parse(
  'https://www.devio.org/io/flutter_app/json/test_common_model.json',
);

class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); //fix中文乱码
      final result = json.decode(utf8decoder.convert(response.bodyBytes));
      return new CommonModel.fromJson(result);
    } else {
      throw Exception('加载失败！！！');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future 与 FutureBuilder 实用技巧'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<CommonModel>(
        future: fetchPost(),
        builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Input a url to start');
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return Text('');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return Column(children: <Widget>[
                  Text('title:${snapshot.data!.title}'),
                  Text('statusBarColor:${snapshot.data!.statusBarColor}'),
                  Text('icon:${snapshot.data!.icon}'),
                  Text('url:${snapshot.data!.url}'),
                ]);
              }
          }
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var url = Uri.parse(
  'https://www.devio.org/io/flutter_app/json/test_common_model.json',
);

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({
    required this.icon,
    required this.title,
    required this.url,
    required this.statusBarColor,
    required this.hideAppBar,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar'],
      );
}

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
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
        title: Text('http'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              fetchPost().then((CommonModel value) {
                setState(() {
                  showResult =
                      '请求结果：\ntitle：${value.title}\nstatusBarColor：${value.statusBarColor}\nhideAppBar：${value.hideAppBar}\nicon：${value.icon}';
                });
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '点我',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Text(showResult),
        ],
      ),
    );
  }
}

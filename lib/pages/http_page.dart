import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var url = Uri.parse(
  'https://www.devio.org/io/flutter_app/json/test_common_model.json',
);

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class CommonModel {
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  CommonModel({
    required this.icon,
    required this.title,
    required this.url,
    required this.statusBarColor,
    required this.hideAppBar,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
        icon: asT<String>(json['icon'])!,
        title: asT<String>(json['title'])!,
        url: asT<String>(json['url'])!,
        statusBarColor: asT<String>(json['statusBarColor'])!,
        hideAppBar: asT<bool>(json['hideAppBar'])!,
      );

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'icon': icon,
        'title': title,
        'url': url,
        'statusBarColor': statusBarColor,
        'hideAppBar': hideAppBar,
      };

  CommonModel clone() => CommonModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
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

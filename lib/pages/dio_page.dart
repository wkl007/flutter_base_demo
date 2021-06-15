import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_demo/pages/http_page.dart';

const url = 'https://www.devio.org/io/flutter_app/json/test_common_model.json';

class DioPage extends StatefulWidget {
  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  String data = '';

  Future<Null> _loadData() async {
    try {
      Response response = await Dio().get(url);
      CommonModel result = CommonModel.fromJson(response.data);
      print(result.toString());
      setState(() {
        data = response.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('dio使用'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: _loadData,
              child: Text('请求数据'),
            ),
            Flexible(
              child: ListView(
                children: <Widget>[
                  Text(data != '' ? data : '暂无数据'),
                ],
              ),
            ),
          ],
        ));
  }
}

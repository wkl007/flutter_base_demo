import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_demo/pages/http_page.dart';

const url = 'https://www.devio.org/io/flutter_app/json/test_common_model.json';

class DioPage extends StatefulWidget {
  const DioPage({Key? key}) : super(key: key);

  @override
  State<DioPage> createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  String data = '';

  Future<void> _loadData() async {
    try {
      Response response = await Dio().get(url);
      CommonModel result = CommonModel.fromJson(response.data);
      if (kDebugMode) {
        print(result.url);
      }
      setState(() {
        data = response.toString();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dio使用'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _loadData,
            child: const Text('请求数据'),
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
                Text(data != '' ? data : '暂无数据'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

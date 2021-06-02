import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_demo/pages/flutter_layout_page.dart';
import 'package:flutter_base_demo/pages/gesture_page.dart';
import 'package:flutter_base_demo/pages/launch_page.dart';
import 'package:flutter_base_demo/pages/less_group_page.dart';
import 'package:flutter_base_demo/pages/plugin_use.dart';
import 'package:flutter_base_demo/pages/resource_page.dart';
import 'package:flutter_base_demo/pages/stateful_group_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Study Demo')),
        body: RouteNavigator(),
      ),
      routes: {
        'plugin': (BuildContext context) => PluginUsePage(),
        'less': (BuildContext context) => StateLessGroupPage(),
        'ful': (BuildContext context) => StateFulGroupPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResourcePage(),
        'launch': (BuildContext context) => LaunchPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名称跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            }),
        Flexible(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              _item('plugin 使用', PluginUsePage(), 'plugin'),
              _item('StatelessWidget 与基础组件', StateLessGroupPage(), 'less'),
              _item('StateFulWidget 与基础组件', StateFulGroupPage(), 'ful'),
              _item('如何进行 Flutter 布局开发', FlutterLayoutPage(), 'layout'),
              _item('用户手势及点击事件', GesturePage(), 'gesture'),
              _item('导入和使用 Flutter 的资源文件', ResourcePage(), 'resource'),
              _item('打开第三方应用', LaunchPage(), 'launch'),
            ],
          ),
        )
      ],
    );
  }

  Widget _item(String title, Widget page, String routeName) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => page),
            );
          }
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_demo/pages/advanced_list_page.dart';
import 'package:flutter_base_demo/pages/dio_page.dart';
import 'package:flutter_base_demo/pages/expansion_title_page.dart';
import 'package:flutter_base_demo/pages/flutter_layout_page.dart';
import 'package:flutter_base_demo/pages/future_page.dart';
import 'package:flutter_base_demo/pages/gesture_page.dart';
import 'package:flutter_base_demo/pages/grid_view_page.dart';
import 'package:flutter_base_demo/pages/http_page.dart';
import 'package:flutter_base_demo/pages/launch_page.dart';
import 'package:flutter_base_demo/pages/less_group_page.dart';
import 'package:flutter_base_demo/pages/list_page.dart';
import 'package:flutter_base_demo/pages/photo_app_page.dart';
import 'package:flutter_base_demo/pages/plugin_use.dart';
import 'package:flutter_base_demo/pages/resource_page.dart';
import 'package:flutter_base_demo/pages/shared_preferences_page.dart';
import 'package:flutter_base_demo/pages/stateful_group_page.dart';
import 'package:flutter_base_demo/pages/tab_app_bar_page.dart';
import 'package:flutter_base_demo/pages/az_list_page.dart';
import 'package:flutter_base_demo/pages/webview_page.dart';

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
        'photo': (BuildContext context) => PhotoAppPage(),
        'tabAppBar': (BuildContext context) => TabAppBarPage(),
        'http': (BuildContext context) => HttpPage(),
        'dio': (BuildContext context) => DioPage(),
        'future': (BuildContext context) => FuturePage(),
        'sharedPreferences': (BuildContext context) => SharedPreferencesPage(),
        'list': (BuildContext context) => ListPage(),
        'advancedList': (BuildContext context) => AdvancedListPage(),
        'expansionTitle': (BuildContext context) => ExpansionTitlePage(),
        'gridView': (BuildContext context) => GridViewPage(),
        'azList': (BuildContext context) => AzListPage(),
        'webView': (BuildContext context) => WebviewPage(),
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
          },
        ),
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
              _item('photo', PhotoAppPage(), 'photo'),
              _item('顶部tab', TabAppBarPage(), 'tabbedAppBar'),
              _item('http 使用', HttpPage(), 'http'),
              _item('dio 使用', DioPage(), 'dio'),
              _item('future 使用', FuturePage(), 'future'),
              _item('sharedPreferences 使用', SharedPreferencesPage(),
                  'sharedPreferences'),
              _item('基础list使用', ListPage(), 'list'),
              _item('高级列表使用', AdvancedListPage(), 'advancedList'),
              _item('expansionTitle使用', ExpansionTitlePage(), 'expansionTitle'),
              _item('网格布局', GridViewPage(), 'gridView'),
              _item('城市索引', AzListPage(), 'azList'),
              _item('webView', WebviewPage(), 'webView'),
            ],
          ),
        ),
      ],
    );
  }
}

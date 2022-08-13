import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_demo/pages/advanced_list_page.dart';
import 'package:flutter_base_demo/pages/animation_page.dart';
import 'package:flutter_base_demo/pages/az_list_page.dart';
import 'package:flutter_base_demo/pages/dio_page.dart';
import 'package:flutter_base_demo/pages/expansion_title_page.dart';
import 'package:flutter_base_demo/pages/flutter_layout_page.dart';
import 'package:flutter_base_demo/pages/future_page.dart';
import 'package:flutter_base_demo/pages/gesture_page.dart';
import 'package:flutter_base_demo/pages/grid_view_page.dart';
import 'package:flutter_base_demo/pages/hero_animation_page.dart';
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
import 'package:flutter_base_demo/pages/toast_context_page.dart';
import 'package:flutter_base_demo/pages/toast_no_context_page.dart';
import 'package:flutter_base_demo/pages/webview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Study Demo')),
        body: const RouteNavigator(),
      ),
      routes: {
        'plugin': (BuildContext context) => const PluginUsePage(),
        'less': (BuildContext context) => const StateLessGroupPage(),
        'ful': (BuildContext context) => const StateFulGroupPage(),
        'layout': (BuildContext context) => const FlutterLayoutPage(),
        'gesture': (BuildContext context) => const GesturePage(),
        'resource': (BuildContext context) => const ResourcePage(),
        'launch': (BuildContext context) => const LaunchPage(),
        'photo': (BuildContext context) => const PhotoAppPage(),
        'tabAppBar': (BuildContext context) => const TabAppBarPage(),
        'http': (BuildContext context) => const HttpPage(),
        'dio': (BuildContext context) => const DioPage(),
        'future': (BuildContext context) => const FuturePage(),
        'sharedPreferences': (BuildContext context) =>
            const SharedPreferencesPage(),
        'list': (BuildContext context) => const ListPage(),
        'advancedList': (BuildContext context) => const AdvancedListPage(),
        'expansionTitle': (BuildContext context) => const ExpansionTitlePage(),
        'gridView': (BuildContext context) => const GridViewPage(),
        'azList': (BuildContext context) => const AzListPage(),
        'webView': (BuildContext context) => const WebviewPage(),
        'toastNoContext': (BuildContext context) => const ToastNoContextPage(),
        'toastContext': (BuildContext context) => const ToastContextPage(),
        'animation': (BuildContext context) => const AnimationPage(),
        'hero': (BuildContext context) => const HeroAnimationPage(),
        'radialHero': (BuildContext context) => const RadialExpansionDemo(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  const RouteNavigator({Key? key}) : super(key: key);

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  Widget _item(String title, Widget page, String routeName) {
    return Container(
      margin: const EdgeInsets.all(10),
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
          style: const TextStyle(color: Colors.white),
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
              _item('plugin 使用', const PluginUsePage(), 'plugin'),
              _item(
                  'StatelessWidget 与基础组件', const StateLessGroupPage(), 'less'),
              _item('StateFulWidget 与基础组件', const StateFulGroupPage(), 'ful'),
              _item('如何进行 Flutter 布局开发', const FlutterLayoutPage(), 'layout'),
              _item('用户手势及点击事件', const GesturePage(), 'gesture'),
              _item('导入和使用 Flutter 的资源文件', const ResourcePage(), 'resource'),
              _item('打开第三方应用', const LaunchPage(), 'launch'),
              _item('photo', const PhotoAppPage(), 'photo'),
              _item('顶部tab', const TabAppBarPage(), 'tabAppBar'),
              _item('http 使用', const HttpPage(), 'http'),
              _item('dio 使用', const DioPage(), 'dio'),
              _item('future 使用', const FuturePage(), 'future'),
              _item('sharedPreferences 使用', const SharedPreferencesPage(),
                  'sharedPreferences'),
              _item('基础list使用', const ListPage(), 'list'),
              _item('高级列表使用', const AdvancedListPage(), 'advancedList'),
              _item('expansionTitle使用', const ExpansionTitlePage(),
                  'expansionTitle'),
              _item('网格布局', const GridViewPage(), 'gridView'),
              _item('城市索引', const AzListPage(), 'azList'),
              _item('webView', const WebviewPage(), 'webView'),
              _item('toast no context', const ToastNoContextPage(),
                  'toastNoContext'),
              _item('toast context', const ToastContextPage(), 'toastContext'),
              _item('普通动画', const AnimationPage(), 'animation'),
              _item('hero 动画', const HeroAnimationPage(), 'hero'),
              _item('hero 径向动画', const RadialExpansionDemo(), 'radialHero'),
            ],
          ),
        )
      ],
    );
  }
}

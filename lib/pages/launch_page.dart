import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 打开第三方应用
class LaunchPage extends StatelessWidget {
  void _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openMap() async {
    // android
    const url = 'geo:108.93,34.27'; //APP提供的 schema
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      const url = 'http://maps.apple.com?ll=108.93,34.27';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  void _telPhone() async {
    const phone = 'tel:+1 555 010 999';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('打开第三方应用'),
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
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('打开网页'),
            ),
            ElevatedButton(
              onPressed: _openMap,
              child: Text('打开地图'),
            ),
            ElevatedButton(
              onPressed: _telPhone,
              child: Text('打电话'),
            ),
          ],
        ),
      ),
    );
  }
}

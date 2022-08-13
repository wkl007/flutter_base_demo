import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 打开第三方应用
class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  void _launchURL() async {
    final Uri url = Uri.parse('https://www.baidu.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openMap() async {
    // android
    final Uri url = Uri.parse('geo:108.93,34.27'); //APP提供的 schema
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      final Uri url = Uri.parse('https://maps.apple.com?ll=108.93,34.27');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  void _telPhone() async {
    final Uri phone = Uri.parse('tel:+1 555 010 999');

    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('打开第三方应用'),
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
          children: [
            ElevatedButton(
              onPressed: _launchURL,
              child: const Text('打开网页'),
            ),
            ElevatedButton(
              onPressed: _openMap,
              child: const Text('打开地图'),
            ),
            ElevatedButton(
              onPressed: _telPhone,
              child: const Text('打电话'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

const Map<String, List<String>> cityNames = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

class ExpansionTitlePage extends StatelessWidget {
  const ExpansionTitlePage({Key? key}) : super(key: key);

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    for (var key in cityNames.keys) {
      widgets.add(_item(key, cityNames[key] as List<String>));
    }
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(city,
          style: const TextStyle(color: Colors.black54, fontSize: 20)),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTitle使用'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: _buildList(),
      ),
    );
  }
}

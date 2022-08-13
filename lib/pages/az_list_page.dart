import 'dart:convert';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_demo/utils/utils.dart';
import 'package:lpinyin/lpinyin.dart';

class AzListPage extends StatefulWidget {
  const AzListPage({Key? key}) : super(key: key);

  @override
  State<AzListPage> createState() => _AzListPageState();
}

class _AzListPageState extends State<AzListPage> {
  List<CityModel> cityList = [];
  final List<CityModel> _hotCityList = [];

  @override
  void initState() {
    super.initState();
    _hotCityList.add(CityModel(name: '北京市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '广州市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '成都市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '深圳市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '杭州市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '武汉市', tagIndex: '★'));
    cityList.addAll(_hotCityList);
    SuspensionUtil.setShowSuspensionStatus(cityList);
    Future.delayed(const Duration(milliseconds: 500), () {
      loadData();
    });
  }

  void loadData() {
    rootBundle.loadString('assets/data/china.json').then((value) {
      cityList.clear();
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      for (var v in list) {
        cityList.add(CityModel.fromJson(v));
      }
      _handleList(cityList);
    });
  }

  void _handleList(List<CityModel> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }

    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(list);

    // add hotCityList.
    cityList.insertAll(0, _hotCityList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(cityList);

    setState(() {});
  }

  Widget header() {
    return Container(
      color: Colors.white,
      height: 44.0,
      child: Row(
        children: <Widget>[
          const Expanded(
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: InputBorder.none,
                labelStyle: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                hintText: '城市中文名或拼音',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFCCCCCC),
                ),
              ),
            ),
          ),
          Container(
            width: 0.33,
            height: 14.0,
            color: const Color(0xFFEFEFEF),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "取消",
                style: TextStyle(color: Color(0xFF999999), fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(
              child: Material(
                color: const Color(0x80000000),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 15.0),
                        height: 50.0,
                        child: const Text("当前城市: 成都市"),
                      ),
                      Expanded(
                        child: AzListView(
                          data: cityList,
                          itemCount: cityList.length,
                          itemBuilder: (BuildContext context, int index) {
                            CityModel model = cityList[index];
                            return Utils.getListItem(context, model);
                          },
                          padding: EdgeInsets.zero,
                          susItemBuilder: (BuildContext context, int index) {
                            CityModel model = cityList[index];
                            String tag = model.getSuspensionTag();
                            return Utils.getSusItem(context, tag);
                          },
                          indexBarData: const ['★', ...kIndexBarData],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CityModel extends ISuspensionBean {
  String name;
  String? tagIndex;
  String? namePinyin;

  CityModel({
    required this.name,
    this.tagIndex,
    this.namePinyin,
  });

  CityModel.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}

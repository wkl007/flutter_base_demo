import 'package:flutter/material.dart';

class StateFulGroupPage extends StatefulWidget {
  @override
  _StateFulGroupPageState createState() => _StateFulGroupPageState();
}

class _StateFulGroupPageState extends State<StateFulGroupPage> {
  int _currentIndex = 0;
  int _count = 0;
  TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFulWidget 与基础组件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: _currentIndex == 0 ? _firstPage() : _secondPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.blue),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.grey),
            activeIcon: Icon(Icons.list, color: Colors.blue),
            label: '列表',
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count = _count + 1;
          });
        },
        child: Text('点我'),
      ),
    );
  }

  Future _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return null;
  }

  Widget _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
    );
  }

  Widget _firstPage() {
    return RefreshIndicator(
      child: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              '点了${_count}次',
              style: textStyle,
            ),
            Icon(
              Icons.android,
              size: 50,
              color: Colors.red,
            ),
            CloseButton(),
            BackButton(),
            Chip(
              avatar: Icon(Icons.people),
              label: Text('老王爱小王'),
            ),
            Divider(
              height: 10, //容器高度，不是线的高度
              indent: 10, //左侧间距
              color: Colors.orange,
            ),
            Card(
              color: Colors.blue,
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text('I am a Card', style: textStyle),
              ),
            ),
          ],
        ),
      ),
      onRefresh: _handleRefresh,
    );
  }

  Widget _secondPage() {
    return Container(
      child: Column(
        children: [
          Text(
            '点了${_count}次',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Image.network(
            'https://sxjg-elevator.ks3-cn-beijing.ksyun.com/tiantong-weapp/upload/2021-05-27/2021-05-27-09-59-53-913.jpg',
            width: 100,
            height: 100,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              hintText: '请输入',
              hintStyle: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            child: PageView(
              children: <Widget>[
                _item('Page1', Colors.deepPurple),
                _item('Page2', Colors.green),
                _item('Page3', Colors.red)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

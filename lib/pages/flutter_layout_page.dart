import 'package:flutter/material.dart';

///如何进行Flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;
  int _count = 0;
  TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.white);

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

  Widget _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget _firstPage() {
    return RefreshIndicator(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
            alignment: Alignment.center,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      'http://p1.pstatp.com/large/61640000c66f7b2cf064',
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.network(
                        'http://p1.pstatp.com/large/61640000c66f7b2cf064',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  //创建一个wrap布局，从左向右进行排列，会自动换行
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    _chip('Flutter1'),
                    _chip('Flutter2'),
                    _chip('Flutter3'),
                    _chip('Flutter4'),
                    _chip('Flutter5'),
                  ],
                )
              ],
            ),
          )
        ],
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('拉伸填满高度'),
            ),
          ),
          Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'http://p1.pstatp.com/large/61640000c66f7b2cf064',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.network(
                      'http://p1.pstatp.com/large/61640000c66f7b2cf064',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ],
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
          Column(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  child: Text('宽度撑满'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何进行 Flutter 布局开发'),
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
}

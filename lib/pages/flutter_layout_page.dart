import 'package:flutter/material.dart';

///如何进行Flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  const FlutterLayoutPage({Key? key}) : super(key: key);

  @override
  State<FlutterLayoutPage> createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;
  int _count = 0;
  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  Future _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return null;
  }

  Widget _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget _firstPage() {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            alignment: Alignment.center,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://pic1.zhimg.com/v2-e7b39fa12c38919a23b35d4b40017000_b.jpg',
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.network(
                        'https://pic1.zhimg.com/v2-e7b39fa12c38919a23b35d4b40017000_b.jpg',
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
    );
  }

  Widget _secondPage() {
    return Column(
      children: [
        Text(
          '点了$_count次',
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Text('拉伸填满高度'),
          ),
        ),
        Row(
          children: [
            ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://pic1.zhimg.com/v2-e7b39fa12c38919a23b35d4b40017000_b.jpg',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Opacity(
                  opacity: 0.2,
                  child: Image.network(
                    'https://pic1.zhimg.com/v2-e7b39fa12c38919a23b35d4b40017000_b.jpg',
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
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(color: Colors.lightBlueAccent),
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
                decoration: const BoxDecoration(color: Colors.greenAccent),
                child: const Text('宽度撑满'),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('如何进行 Flutter 布局开发'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: _currentIndex == 0 ? _firstPage() : _secondPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
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
        child: const Text('点我'),
      ),
    );
  }
}

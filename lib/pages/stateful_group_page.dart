import 'package:flutter/material.dart';

class StateFulGroupPage extends StatefulWidget {
  const StateFulGroupPage({Key? key}) : super(key: key);

  @override
  State<StateFulGroupPage> createState() => _StateFulGroupPageState();
}

class _StateFulGroupPageState extends State<StateFulGroupPage> {
  int _currentIndex = 0;
  int _count = 0;
  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFulWidget 与基础组件'),
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
                Text(
                  '点了$_count次',
                  style: textStyle,
                ),
                const Icon(
                  Icons.android,
                  size: 50,
                  color: Colors.red,
                ),
                const CloseButton(),
                const BackButton(),
                const Chip(
                  avatar: Icon(Icons.people),
                  label: Text('老王爱小王'),
                ),
                const Divider(
                  height: 10, //容器高度，不是线的高度
                  indent: 10, //左侧间距
                  color: Colors.orange,
                ),
                Card(
                  color: Colors.blue,
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Text('I am a Card', style: textStyle),
                  ),
                ),
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
        Image.network(
          'https://pic1.zhimg.com/v2-e7b39fa12c38919a23b35d4b40017000_b.jpg',
          width: 100,
          height: 100,
        ),
        const TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            hintText: '请输入',
            hintStyle: TextStyle(fontSize: 16),
          ),
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
      ],
    );
  }
}

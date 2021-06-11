import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  AnimationStatus? animationStatus;
  double? animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    // 图片宽高从0变到300
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      // 动画的值发生变化时调用
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      // 动画状态发生变化时被调用
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationStatus = state;
        });
      });
  }

  @override
  void dispose() {
    // 路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('普通动画'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                controller.reset();
                controller.forward();
              },
              child: Text(
                'Start',
                style: TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'State:${animationStatus.toString()}',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
            Text(
              'Value:${animationValue.toString()}',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
            AnimatedLogo(
              animation: animation,
            ),
            GrowTransition(
              animation: animation,
              child: LogoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Container(
      width: animation.value,
      height: animation.value,
      child: FlutterLogo(),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastNoContextPage extends StatefulWidget {
  @override
  _ToastNoContextPageState createState() => _ToastNoContextPageState();
}

class _ToastNoContextPageState extends State<ToastNoContextPage> {
  void showLongToast() {
    Fluttertoast.showToast(
      msg: "This is Long Toast",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
    );
  }

  void showWebColoredToast() {
    Fluttertoast.showToast(
      msg: "This is Colored Toast with android duration of 5 Sec",
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: "#e74c3c",
      textColor: Colors.black,
      timeInSecForIosWeb: 5,
    );
  }

  void showColoredToast() {
    Fluttertoast.showToast(
      msg: "This is Colored Toast with android duration of 5 Sec",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  void showShortToast() {
    Fluttertoast.showToast(
      msg: "This is Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
    );
  }

  void showTopShortToast() {
    Fluttertoast.showToast(
      msg: "This is Top Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
    );
  }

  void showCenterShortToast() {
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }

  void cancelToast() {
    Fluttertoast.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast No Context'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: showLongToast,
                child: new Text('Show Long Toast'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: showShortToast,
                child: new Text('Show Short Toast'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: showCenterShortToast,
                child: new Text('Show Center Short Toast'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: showTopShortToast,
                child: new Text('Show Top Short Toast'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: showColoredToast,
                child: new Text('Show Colored Toast'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: showWebColoredToast,
                child: new Text('Show Web Colored Toast'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: cancelToast,
                child: new Text('Cancel Toasts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

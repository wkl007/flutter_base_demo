import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastContextPage extends StatefulWidget {
  const ToastContextPage({Key? key}) : super(key: key);

  @override
  State<ToastContextPage> createState() => _ToastContextPageState();
}

class _ToastContextPageState extends State<ToastContextPage> {
  late FToast fToast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  _showBuilderToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 16.0,
          left: 16.0,
          child: child,
        );
      },
    );
  }

  _showToastCancel() {
    Widget toastWithButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            child: Text(
              "This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            color: Colors.white,
            onPressed: () {
              fToast.removeCustomToast();
            },
          )
        ],
      ),
    );
    fToast.showToast(
      child: toastWithButton,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 50),
    );
  }

  _queueToasts() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }

  _removeToast() {
    fToast.removeCustomToast();
  }

  _removeAllQueuedToasts() {
    fToast.removeQueuedCustomToasts();
  }

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("This is a Custom Toast"),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast No Context'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: _showToast,
            child: const Text("Show Custom Toast"),
          ),
          ElevatedButton(
            onPressed: _showBuilderToast,
            child: const Text("Show Custom Toast via PositionedToastBuilder"),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: _showToastCancel,
            child: const Text("Custom Toast With Close Button"),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: _queueToasts,
            child: const Text("Queue Toasts"),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: _removeToast,
            child: const Text("Cancel Toast"),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: _removeAllQueuedToasts,
            child: const Text("Remove Queued Toasts"),
          ),
        ],
      ),
    );
  }
}

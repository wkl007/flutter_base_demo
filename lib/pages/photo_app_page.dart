import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoAppPage extends StatefulWidget {
  const PhotoAppPage({Key? key}) : super(key: key);

  @override
  State<PhotoAppPage> createState() => _PhotoAppPageState();
}

class _PhotoAppPageState extends State<PhotoAppPage> {
  final List<File> _image = [];

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker().pickImage(
      source: isTakePhoto ? ImageSource.camera : ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _image.add(File(image.path));
      });
    }
  }

  void _pickImage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 160,
        child: Column(
          children: [
            _item('拍照', true),
            _item('从相册选择', false),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  List<Widget> _genImages() {
    return _image.map((file) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _image.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('拍照'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

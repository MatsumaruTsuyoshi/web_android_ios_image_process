import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_android_ios_image_process/image_upload.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? uint8list;
  final upload = ImageUpload();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () async {
              await _selectImage(ImageSource.gallery);
            },
            child: Text('画像を選択')),
        TextButton(
            onPressed: () async {
              await _selectImage(ImageSource.camera);
            },
            child: Text('画像を撮影')),
        //画像の表示
        Container(
          child: uint8list == null
              ? const SizedBox()
              : Column(
                  children: [
                    Image.memory(
                      uint8list!,
                      width: 200,
                      height: 200,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await upload.imageUpload(uint8list!);
                      },
                      child: Text('アップロード'),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> _selectImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: source);
    if (image == null) return;
    uint8list = await image.readAsBytes();
    setState(() {});
  }
}

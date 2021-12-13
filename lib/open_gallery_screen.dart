import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OpenGalleryScreen extends StatefulWidget {
  const OpenGalleryScreen({Key key}) : super(key: key);

  @override
  _OpenGalleryScreenState createState() => _OpenGalleryScreenState();
}

class _OpenGalleryScreenState extends State<OpenGalleryScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Open Gallery"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {
              _galleryPicker(context);
            },
            icon: Icon(Icons.image),
            label: Text("Pick Image"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 8,
              shadowColor: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {
              _cameraPicker(context);
            },
            icon: Icon(Icons.image),
            label: Text("Open Camera"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 8,
              shadowColor: Colors.grey,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              width: double.infinity,
              height: double.infinity,
              child: _image != null
                  ? Image.file(
                      File(_image.path),
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/image.png",
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
        ],
      ),
    ));
  }

  _galleryPicker(BuildContext context) async {
    XFile image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (image != null) {
        _image = image;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Image not selected")));
      }
    });
  }

  _cameraPicker(BuildContext context) async {
    XFile image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (image != null) {
        _image = image;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Image not selected")));
      }
    });
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<File> _images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _selectFromGallery();
              },
              child: Text("Pick from gallery"),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _makeAPhoto();
              },
              child: Text("Make a photo"),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  File image = _images[index];
                  return Image.file(image);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectFromGallery() async {
    final returnedXFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (returnedXFile == null) return;

    setState(() {
      _images.add(File(returnedXFile.path));
    });
  }

  Future<void> _makeAPhoto() async {
    final returnedXFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (returnedXFile == null) return;

    setState(() {
      _images.add(File(returnedXFile.path));
    });
  }
}

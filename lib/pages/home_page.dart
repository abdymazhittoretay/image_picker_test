import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Pick from gallery")),
            SizedBox(height: 10.0),
            ElevatedButton(onPressed: () {}, child: Text("Make a photo")),
            SizedBox(height: 10.0),
            selectedImage != null ? Image.file(selectedImage!) : SizedBox(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String image;

  ImagePreviewScreen({required this.image});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(
        backgroundDecoration: BoxDecoration(color: Colors.white),
        imageProvider: NetworkImage(image),
      ),
    );
  }
}

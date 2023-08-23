import 'package:flutter/material.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:tpanime/hooks/downloadimage.dart';
import 'package:tpanime/models/collection/dimensions.dart';

class FullScreenImage extends StatefulWidget {
  final String image;
  const FullScreenImage({super.key, required this.image});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late String image;
  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (image == backupImage) {
                downloadImage("${backupImage}", context);
              } else {
                downloadImage("${image}", context);
              }
            },
            icon: Icon(Icons.more_vert,
                color: Colors.grey, size: Dimensions.screenSize3),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: image == backupImage
            ? Image.asset(
                "${backupImage}",
                fit: BoxFit.cover,
              )
            : Image.network(
                "${image}",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
      ),
    );
  }
}

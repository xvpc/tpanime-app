import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageHolder extends StatelessWidget {
  String placeholderImage = "assets/images/placeholder.png";
  String backupImage = "assets/images/placeholder2.png";
  final String? image;
  final double imageWidth;
  final double imageheight;

  ImageHolder(
      {super.key,
      this.image,
      required this.imageWidth,
      required this.imageheight});

  @override
  Widget build(BuildContext context) {
    if (image == "" || image == null || image!.isEmpty) {
      return Image.asset(
        backupImage,
        fit: BoxFit.cover,
        width: double.maxFinite,
        height: double.maxFinite,
      );
    } else {
      return FadeInImage.assetNetwork(
        fadeInCurve: Curves.fastLinearToSlowEaseIn,
        placeholder: placeholderImage,
        image: '$image',
        fit: BoxFit.cover,
        width: double.maxFinite,
        height: double.maxFinite,
      );
    }
  }
}

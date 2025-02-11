import 'package:flutter/material.dart';

class CommonImageWidget extends StatelessWidget {
  final String imageName;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CommonImageWidget({
    super.key,
    required this.imageName,
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
      fit: fit,
    );
  }
}

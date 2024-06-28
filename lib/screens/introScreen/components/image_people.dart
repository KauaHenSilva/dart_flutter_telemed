import 'package:flutter/material.dart';

class ImagePeople extends StatelessWidget {
  final double size;
  final double sizebottom;
  final String image;
  const ImagePeople({
    super.key,
    required this.size,
    required this.image,
    required this.sizebottom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SizedBox(
            height: size,
            width: double.infinity,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(height: sizebottom),
      ],
    );
  }
}

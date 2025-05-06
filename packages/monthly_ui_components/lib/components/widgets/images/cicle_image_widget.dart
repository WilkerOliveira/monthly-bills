import 'package:flutter/material.dart';

class CicleImageWidget extends StatelessWidget {
  const CicleImageWidget({required this.image, super.key});

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withValues(alpha: 0.2),
      child: image,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key, this.photoUrl});

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return CicleImageWidget(
      image:
          photoUrl == null
              ? const Icon(Icons.person, color: Colors.white)
              : CachedNetworkImage(
                imageUrl: photoUrl!,
                placeholder:
                    (context, url) => const CircularProgressIndicator(),
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.person, color: Colors.white),
              ),
    );
  }
}

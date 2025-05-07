import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/presentation/widgets/profile/profile_photo_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    final user = MonthlyDI.I.get<AuthServiceContract>().currentUser!;
    return Row(
      children: [
        ProfilePhotoWidget(photoUrl: user.photoUrl),
        SizedBox(width: hSmallSpace),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${strings.homeWelcome},',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: defaultFontSize,
              ),
            ),
            Text(
              user.name ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: subTitleTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

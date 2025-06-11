import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MonthlyDI.I.get<AuthServiceContract>().currentUser!;
    return Column(
      children: [
        CicleImageWidget(
          image:
              user.photoUrl == null
                  ? const Icon(Icons.person, color: Colors.white)
                  : CachedNetworkImage(
                    imageUrl: user.photoUrl!,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                  ),
        ),
        SizedBox(height: vSmallSpace),
        Text(
          user.email,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: defaultFontSize,
          ),
        ),
        SizedBox(height: vSmallSpace),
        Text(
          user.name ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: subTitleTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

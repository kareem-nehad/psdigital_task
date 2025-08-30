import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';

class QuickAccessButton extends StatelessWidget {
  final String iconAsset;
  final String title;
  const QuickAccessButton({
    super.key, required this.iconAsset, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: context.rHeight(0.11),
          width: context.rWidth(0.22),
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: AppColors.primaryColor.withValues(alpha: 0.125),
          ),
          child: SvgPicture.asset(iconAsset),
        ),
        Text(
          title,
          style: TextStyles.font18BlackSemiBold,
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.rHeight(0.25),
      width: context.rWidth(1),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1, 
            blurRadius: 4,
            offset:
            const Offset(0, 2),
          ),
        ],
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: TextButton.icon(
              onPressed: () {},
              label: Text(
                'Logout',
                style: TextStyles.font18SecondarySemiBold,
              ),
              icon: SvgPicture.asset(AppIcons.logout),
              iconAlignment: IconAlignment.start,
            ),
          ),
          Positioned(
            top: 0,
            bottom: context.rHeight(0.06),
            left: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColors.secondaryColor,
                      child: Text(
                        'A',
                        style: TextStyles.font24BlackBold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Magdy',
                          style: TextStyles.font18BlackBold,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.egyIcon),
                            const SizedBox(width: 8),
                            Text(
                              '012-000-00-663',
                              style: TextStyles.font18BlackSemiBold,
                            ),
                          ],
                        ),
                        Text(
                          'ahmed@paradigmegypt.com',
                          style: TextStyles.font18SecondarySemiBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  fixedSize: Size(
                    context.rWidth(0.75),
                    context.rHeight(0.02),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Update Profile',
                  style: TextStyles.font18BlackBold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
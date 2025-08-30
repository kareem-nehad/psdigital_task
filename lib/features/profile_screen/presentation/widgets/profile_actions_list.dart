import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';

class ProfileActionsList extends StatelessWidget {
  const ProfileActionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(AppIcons.locationIcon),
          horizontalTitleGap: 4,
          title: Text(
            'My Addresses',
            style: TextStyles.font16BlackSemiBold,
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.black,
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: AppColors.lightSecondaryColor,
        ),
        ListTile(
          leading: SvgPicture.asset(AppIcons.changePasswordIcon),
          horizontalTitleGap: 4,
          title: Text(
            'Change Password',
            style: TextStyles.font16BlackSemiBold,
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.black,
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: AppColors.lightSecondaryColor,
        ),
        ListTile(
          leading: SvgPicture.asset(AppIcons.offersIcon),
          horizontalTitleGap: 4,
          title: Text(
            'Offers',
            style: TextStyles.font16BlackSemiBold,
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.black,
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: AppColors.lightSecondaryColor,
        ),
        ListTile(
          leading: SvgPicture.asset(AppIcons.dealsIcon),
          horizontalTitleGap: 4,
          title: Text(
            'Deals',
            style: TextStyles.font16BlackSemiBold,
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.black,
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: AppColors.lightSecondaryColor,
        ),
        ListTile(
          leading: Badge.count(
            count: 1,
            backgroundColor: AppColors.primaryColor,
            child: SvgPicture.asset(AppIcons.notificationsIcon),
          ),
          horizontalTitleGap: 4,
          title: Text(
            'Notifications',
            style: TextStyles.font16BlackSemiBold,
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: AppColors.black,
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: AppColors.lightSecondaryColor,
        ),
        ListTile(
          leading: SvgPicture.asset(AppIcons.deleteAccountIcon),
          horizontalTitleGap: 4,
          title: Text(
            'Delete my Account',
            style: TextStyles.font18RedSemiBold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';

class ProfileCommunicationsSection extends StatefulWidget {
  const ProfileCommunicationsSection({
    super.key,
  });

  @override
  State<ProfileCommunicationsSection> createState() =>
      _ProfileCommunicationsSectionState();
}

class _ProfileCommunicationsSectionState
    extends State<ProfileCommunicationsSection> {
  bool marketingCommunication = true;
  bool appCommunication = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          value: marketingCommunication,
          onChanged: (choice) => setState(() {
            marketingCommunication = choice;
          }),
          activeTrackColor: AppColors.black,
          inactiveTrackColor: AppColors.black,
          activeThumbColor: AppColors.secondaryColor,
          inactiveThumbColor: AppColors.primaryColor,
          thumbIcon: const WidgetStatePropertyAll(
            Icon(
              Icons.check,
              color: AppColors.black,
            ),
          ),
          isThreeLine: true,
          secondary: SvgPicture.asset(AppIcons.marketingCommunicationIcon),
          title: Text(
            'Marketing Communication',
            style: TextStyles.font18BlackSemiBold,
          ),
          subtitle: Text(
            'Once you open it you will receive emails and offer on your inbox',
            style: TextStyles.font14SecondarySemiBold,
          ),
        ),
        SwitchListTile(
          value: appCommunication,
          onChanged: (choice) => setState(() {
            appCommunication = choice;
          }),
          activeTrackColor: AppColors.black,
          inactiveTrackColor: AppColors.black,
          activeThumbColor: AppColors.secondaryColor,
          inactiveThumbColor: AppColors.primaryColor,
          thumbIcon: const WidgetStatePropertyAll(
            Icon(
              Icons.check,
              color: AppColors.black,
            ),
          ),
          isThreeLine: true,
          secondary: SvgPicture.asset(AppIcons.marketingCommunicationIcon),
          title: Text(
            'App Communication',
            style: TextStyles.font18BlackSemiBold,
          ),
          subtitle: Text(
            'Once you open it you will receive Notifications from our app',
            style: TextStyles.font18SecondarySemiBold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';
import 'package:psdigital_task/features/profile_screen/presentation/widgets/profile_actions_list.dart';
import 'package:psdigital_task/features/profile_screen/presentation/widgets/profile_communcations_section.dart';
import 'package:psdigital_task/features/profile_screen/presentation/widgets/quick_access_button.dart';
import 'package:psdigital_task/layouts/main_layout/cubit/main_layout_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleSpacing: 6,
        leading: IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(4),
            backgroundColor: AppColors.secondaryColor,
          ),
          onPressed: () => MainLayoutCubit.get(context).changeScreen(1),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(context.rWidth(1), 8),
          child: const Divider(
            thickness: 8,
            color: AppColors.lightSecondaryColor,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: context.rHeight(0.20),
              width: context.rWidth(1),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1), // shadow color
                    spreadRadius: 1, // how wide the shadow spreads
                    blurRadius: 4, // softness of the shadow
                    offset:
                        const Offset(0, 2), // horizontal & vertical movement
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
                    bottom: context.rHeight(0.05),
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
            ),
            SizedBox(
              height: context.rHeight(0.05),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                QuickAccessButton(
                  iconAsset: AppIcons.favoritesIcon,
                  title: 'Favorites',
                ),
                QuickAccessButton(
                  iconAsset: AppIcons.rewardsIcon,
                  title: 'Rewards',
                ),
                QuickAccessButton(
                  iconAsset: AppIcons.navBarCart,
                  title: 'Orders',
                ),
              ],
            ),
            Divider(
              height: context.rHeight(0.05),
              thickness: 8,
              color: AppColors.lightSecondaryColor,
            ),
            const ProfileActionsList(),
            Divider(
              height: context.rHeight(0.05),
              thickness: 8,
              color: AppColors.lightSecondaryColor,
            ),
            const ProfileCommunicationsSection(),
          ],
        ),
      ),
    );
  }
}



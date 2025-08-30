import 'package:flutter/material.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/features/profile_screen/presentation/widgets/profile_actions_list.dart';
import 'package:psdigital_task/features/profile_screen/presentation/widgets/profile_communcations_section.dart';
import 'package:psdigital_task/features/profile_screen/presentation/widgets/profile_details_card.dart';
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
            const ProfileDetailsCard(),
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





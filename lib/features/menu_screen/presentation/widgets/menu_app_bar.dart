import 'package:flutter/material.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: const Text('EXPLORE MENU'),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.rHeight(0.01),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

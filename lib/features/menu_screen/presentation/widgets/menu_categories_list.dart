import 'package:flutter/material.dart';
import 'package:psdigital_task/core/assets/app_images.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';
import 'package:psdigital_task/features/menu_screen/presentation/menu_dummy_data.dart';

class MenuCategoriesList extends StatefulWidget {
  const MenuCategoriesList({
    super.key,
  });

  @override
  State<MenuCategoriesList> createState() => _MenuCategoriesListState();
}

class _MenuCategoriesListState extends State<MenuCategoriesList> {
  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
        start: context.rWidth(0.01),
        end: context.rHeight(0.01),
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return RawChip(
          key: ValueKey(index),
          onPressed: () => setState(() {
            selectedCategoryIndex = index;
          }),
          selected: selectedCategoryIndex == index ? true : false,
          avatar: const CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.white,
            backgroundImage: AssetImage(AppImages.category_1),
          ),
          label: Text(dummyMenuCategories[index]),
          labelStyle: TextStyles.font18BlackSemiBold,
          selectedColor: AppColors.primaryColor,
          backgroundColor: AppColors.white,
          showCheckmark: false,
          shape: const StadiumBorder(
            side: BorderSide(color: AppColors.primaryColor),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: context.rWidth(0.03),
      ),
    );
  }
}

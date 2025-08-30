import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:psdigital_task/features/menu_screen/presentation/widgets/add_to_cart_button.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;

  const MenuItem({
    super.key,
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.rHeight(0.25),
      width: context.rWidth(1),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // shadow color
            spreadRadius: 1, // how wide the shadow spreads
            blurRadius: 4, // softness of the shadow
            offset: const Offset(0, 2), // horizontal & vertical movement
          ),
        ],
        color: AppColors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: context.rWidth(0.3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: AppColors.lightSecondaryColor,
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: menuItem.imageUrl ?? '',
              ),
            ),
          ),
          SizedBox(width: context.rWidth(0.02)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AutoSizeText(
                      menuItem.itemName ?? '-',
                      style: TextStyles.font20BlackBold,
                    ),
                    StatefulBuilder(
                      builder: (
                        BuildContext context,
                        void Function(void Function()) setState,
                      ) {
                        return IconButton(
                          onPressed: () => setState(() {
                            menuItem.isFavorite = !menuItem.isFavorite;
                          }),
                          icon: Icon(
                            menuItem.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: context.rHeight(0.001)),
                AutoSizeText(
                  menuItem.itemDescription ?? '-',
                  style: TextStyles.font16SecondaryRegular,
                  maxLines: 2,
                ),
                SizedBox(height: context.rHeight(0.001)),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  label: AutoSizeText(
                    'Customize',
                    style: TextStyles.font18RedBold,
                  ),
                  icon: SvgPicture.asset(AppIcons.customizeChevron),
                  iconAlignment: IconAlignment.end,
                ),
                Row(
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        '${menuItem.itemPrice?.round()} BD',
                        style: TextStyles.font20BlackBold,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: context.rWidth(0.02)),
                    Flexible(
                      child: AutoSizeText(
                        '${(menuItem.itemPrice?.round() ?? 0) + 50} BD',
                        style: TextStyles.font16SecondaryRegular.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.secondaryTextColor,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: AddToCartButton(menuItem: menuItem),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

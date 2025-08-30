import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
    required this.menuItem,
  });

  final MenuItemModel menuItem;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return widget.menuItem.count == 0
        ? ElevatedButton.icon(
            onPressed: () => setState(() {
              widget.menuItem.count++;
            }),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              fixedSize: Size(context.rWidth(0.24), context.rHeight(0.02)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
            ),
            label: AutoSizeText(
              'Add To Cart',
              style: TextStyles.font18BlackSemiBold,
              maxLines: 1,
            ),
            icon: const Icon(
              Icons.add,
              color: AppColors.black,
            ),
          )
        : SizedBox(
            width: context.rWidth(0.24),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => setState(() {
                      widget.menuItem.count--;
                    }),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      elevation: 4,
                      shadowColor: AppColors.black.withValues(alpha: 0.75),
                      padding: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fixedSize: Size(
                        context.rWidth(0.05),
                        context.rHeight(0.045),
                      ),
                    ),
                    icon: widget.menuItem.count == 1
                        ? SvgPicture.asset(
                            AppIcons.delete,
                            height: context.rHeight(0.02),
                            width: context.rWidth(0.04),
                          )
                        : const Icon(
                            Icons.remove,
                            color: AppColors.black,
                            size: 28,
                          ),
                  ),
                  SizedBox(width: context.rWidth(0.023)),
                  Text(
                    '${widget.menuItem.count}',
                    style: TextStyles.font16BlackBold,
                  ),
                  SizedBox(width: context.rWidth(0.023)),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      elevation: 4,
                      shadowColor: AppColors.black.withValues(alpha: 0.75),
                      padding: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fixedSize: Size(
                        context.rWidth(0.05),
                        context.rHeight(0.045),
                      ),
                    ),
                    onPressed: () => setState(() {
                      widget.menuItem.count++;
                    }),
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.black,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubble_box/bubble_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';

class CartBubble extends StatelessWidget {
  const CartBubble({
    super.key,
    required this.cartBubbleOpacity,
  });

  final double cartBubbleOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: cartBubbleOpacity,
      child: Center(
        child: SizedBox(
          height: context.rHeight(0.065),
          width: context.rWidth(0.4),
          child: BubbleBox(
            maxHeight: context.rHeight(0.065),
            maxWidth: context.rWidth(0.4),
            backgroundColor: AppColors.red,
            shape: BubbleShapeBorder(
              arrowHeight: 20,
              smooth: 0,
              position: const BubblePosition.center(0),
              direction: BubbleDirection.bottom,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: SvgPicture.asset(
                    AppIcons.cartIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.white.withValues(alpha: 0.25),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      'view cart',
                      style: TextStyles.font18WhiteSemiBold,
                    ),
                    AutoSizeText(
                      '333 BD',
                      style: TextStyles.font18WhiteSemiBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
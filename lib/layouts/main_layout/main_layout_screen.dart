import 'package:bubble_box/bubble_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/assets/app_icons.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';
import 'package:psdigital_task/layouts/main_layout/cubit/main_layout_cubit.dart';
import 'package:psdigital_task/layouts/main_layout/widgets/cart_bubble.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late final PageController _pageController;
  double cartBubbleOpacity = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      builder: (context, state) {
        final cubit = MainLayoutCubit.get(context);
        return Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: cubit.screens,
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: context.rHeight(0.145),
                child: BottomNavigationBar(
                  currentIndex: state.screenIndex,
                  onTap: (index) {
                    if (index == 2) return;
                    cubit.changeScreen(index);
                    _pageController.jumpToPage(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  backgroundColor: AppColors.white,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.black,
                  selectedLabelStyle: TextStyles.font14BlackSemiBold,
                  unselectedLabelStyle: TextStyles.font14BlackSemiBold,
                  useLegacyColorScheme: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.navBarHome,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          state.screenIndex == 0
                              ? AppColors.primaryColor
                              : AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.navBarMenu,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          state.screenIndex == 1
                              ? AppColors.primaryColor
                              : AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Menu',
                    ),
                    BottomNavigationBarItem(
                      icon: Badge.count(
                        count: 12,
                        backgroundColor: AppColors.white,
                        textColor: AppColors.black,
                        textStyle: TextStyles.font18BlackSemiBold,
                        smallSize: 30,
                        alignment: Alignment.topLeft,
                        offset: const Offset(0, 5),
                        child: FloatingActionButton.large(
                          heroTag: 'cart',
                          onPressed: () => setState(() {
                            if (cartBubbleOpacity == 0) {
                              cartBubbleOpacity = 1;
                            } else {
                              cartBubbleOpacity = 0;
                            }
                          }),
                          child: SvgPicture.asset(AppIcons.navBarCart),
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.navBarProfile,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          state.screenIndex == 3
                              ? AppColors.primaryColor
                              : AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.navBarMore,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          state.screenIndex == 4
                              ? AppColors.primaryColor
                              : AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'More',
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: -45,
                child: CartBubble(
                  cartBubbleOpacity: cartBubbleOpacity,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

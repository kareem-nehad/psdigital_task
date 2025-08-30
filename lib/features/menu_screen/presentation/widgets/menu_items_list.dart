import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/features/menu_screen/presentation/cubit/menu_items_cubit.dart';

import 'menu_item.dart';

class MenuItemsList extends StatelessWidget {
  const MenuItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuItemsCubit, MenuItemsState>(
      builder: (context, state) {
        switch (state) {
          case MenuItemsInitial():
            return const SizedBox.shrink();

          case MenuItemsLoading():
            return const SliverToBoxAdapter(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
              ),
            );

          case MenuItemsSuccess():
            return SliverList.separated(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return MenuItem(
                  key: ValueKey(state.items[index].itemId),
                  menuItem: state.items[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: context.rHeight(0.01));
              },
            );

          case MenuItemsFailure():
            return SliverToBoxAdapter(
              child: Center(
                child: Text(state.error),
              ),
            );
        }
      },
    );
  }
}

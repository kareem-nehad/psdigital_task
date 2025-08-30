import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psdigital_task/core/di/di.dart';
import 'package:psdigital_task/core/extensions/sizes_context_extension.dart';
import 'package:psdigital_task/core/theme/text_styles.dart';
import 'package:psdigital_task/features/menu_screen/presentation/cubit/menu_items_cubit.dart';
import 'package:psdigital_task/features/menu_screen/presentation/widgets/menu_app_bar.dart';
import 'package:psdigital_task/features/menu_screen/presentation/widgets/menu_categories_list.dart';
import 'package:psdigital_task/features/menu_screen/presentation/widgets/menu_items_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      di<MenuItemsCubit>()
        ..getMenuItems(),
      child: Scaffold(
        appBar: const MenuAppBar(),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            top: context.rHeight(0.03),
            start: context.rWidth(0.03),
            end: context.rWidth(0.03),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: context.rHeight(0.04),
                  child: const MenuCategoriesList(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: context.rHeight(0.03),
                ),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<MenuItemsCubit, MenuItemsState>(
                  builder: (context, state) {
                    return Text.rich(
                      TextSpan(
                        text: 'Sandwiches',
                        style: TextStyles.font22BlackBold,
                        children: [
                          TextSpan(
                            text: ' (${state is MenuItemsSuccess ? state.items.length : 0} Items)',
                            style: TextStyles.font16BlackRegular,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: context.rHeight(0.015),
                ),
              ),
              const MenuItemsList(),
            ],
          ),
        ),
      ),
    );
  }
}

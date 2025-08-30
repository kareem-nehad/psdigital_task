import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';
import 'package:psdigital_task/features/menu_screen/domain/use_cases/get_menu_items_use_case.dart';

part 'menu_items_state.dart';

class MenuItemsCubit extends Cubit<MenuItemsState> {
  final GetMenuItemsUseCase _menuItemsUseCase;

  MenuItemsCubit(this._menuItemsUseCase) : super(MenuItemsInitial());
  
  static MenuItemsCubit get(BuildContext context) => BlocProvider.of(context);

  final Map<String, dynamic> _queryParameters = {
    'ItemName': null,
  };

  Future<void> getMenuItems() async {
    emit(MenuItemsLoading());
    final result = await _menuItemsUseCase.execute(
      queryParameters: _queryParameters,
    );

    result.fold(
      (failure) {
        emit(MenuItemsFailure(failure.message ?? 'Unknown Error'));
      },
      (menuItems) {
        emit(MenuItemsSuccess(menuItems));
      },
    );
  }
}

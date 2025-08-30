part of 'menu_items_cubit.dart';

@immutable
sealed class MenuItemsState extends Equatable {
  const MenuItemsState();

  @override
  List<Object> get props => [];
}

final class MenuItemsInitial extends MenuItemsState {}

final class MenuItemsLoading extends MenuItemsState {}

final class MenuItemsSuccess extends MenuItemsState {
  final List<MenuItemModel> items;

  const MenuItemsSuccess(this.items);

  @override
  List<Object> get props => [items];
}

final class MenuItemsFailure extends MenuItemsState {
  final String error;

  const MenuItemsFailure(this.error);

  @override
  List<Object> get props => [error];
}

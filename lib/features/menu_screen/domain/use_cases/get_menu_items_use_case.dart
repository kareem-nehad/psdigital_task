import 'package:fpdart/fpdart.dart';
import 'package:psdigital_task/core/error/api_error_model.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';
import 'package:psdigital_task/features/menu_screen/domain/repository/menu_repository.dart';

class GetMenuItemsUseCase {
  final MenuRepository repository;

  GetMenuItemsUseCase(this.repository);

  Future<Either<ApiErrorModel, List<MenuItemModel>>> execute({
    required Map<String, dynamic> queryParameters,
  }) async {
    return await repository.getMenuItems(queryParameters: queryParameters);
  }
}

import 'package:psdigital_task/core/error/api_error_model.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class MenuRepository {
  Future<Either<ApiErrorModel, List<MenuItemModel>>> getMenuItems({
    required Map<String, dynamic> queryParameters,
  });
}

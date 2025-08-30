import 'package:fpdart/fpdart.dart';
import 'package:psdigital_task/core/error/api_error_model.dart';
import 'package:psdigital_task/features/menu_screen/data/data_source/menu_data_source.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';
import 'package:psdigital_task/features/menu_screen/domain/repository/menu_repository.dart';

class MenuRepositoryImpl extends MenuRepository {
  final MenuDataSource dataSource;

  MenuRepositoryImpl(this.dataSource);

  @override
  Future<Either<ApiErrorModel, List<MenuItemModel>>> getMenuItems(
      {required Map<String, dynamic> queryParameters,}) async {
    try {
      final response =
          await dataSource.getMenuItems(queryParameters: queryParameters);
      return Right(response);
    } catch (e) {
      return Left(
        ApiErrorModel.fromString(
          e.toString(),
        ),
      );
    }
  }
}

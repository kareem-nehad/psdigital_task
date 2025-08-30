import 'package:dio/dio.dart';
import 'package:psdigital_task/core/network/endpoints.dart';
import 'package:psdigital_task/features/menu_screen/data/models/menu_item_model.dart';

class MenuDataSource {
  final Dio dio;

  MenuDataSource(this.dio);

  Future<List<MenuItemModel>> getMenuItems({
    required Map<String, dynamic> queryParameters,
  }) async {
    final response = await dio.get(
      Endpoints.items,
      queryParameters: queryParameters,
    );

    return (response.data as List)
        .map((item) => MenuItemModel.fromJson(item))
        .toList();
  }
}

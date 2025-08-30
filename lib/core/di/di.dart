import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:psdigital_task/core/network/app_interceptor.dart';
import 'package:psdigital_task/features/menu_screen/data/data_source/menu_data_source.dart';
import 'package:psdigital_task/features/menu_screen/data/repository/menu_repository_impl.dart';
import 'package:psdigital_task/features/menu_screen/domain/repository/menu_repository.dart';
import 'package:psdigital_task/features/menu_screen/domain/use_cases/get_menu_items_use_case.dart';
import 'package:psdigital_task/features/menu_screen/presentation/cubit/menu_items_cubit.dart';
import 'package:psdigital_task/layouts/main_layout/cubit/main_layout_cubit.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  await dotenv.load(fileName: ".env");

  di.registerLazySingleton<Dio>(
    () {
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      dio.interceptors.add(const AppInterceptor());
      return dio;
    },
  );

  // Data Sources
  di.registerLazySingleton<MenuDataSource>(
    () => MenuDataSource(
      di<Dio>(),
    ),
  );

  // Repositories
  di.registerLazySingleton<MenuRepository>(
    () => MenuRepositoryImpl(
      di<MenuDataSource>(),
    ),
  );

  // Use Cases
  di.registerFactory<GetMenuItemsUseCase>(
    () => GetMenuItemsUseCase(
      di<MenuRepository>(),
    ),
  );

  // Cubits
  di.registerFactory<MainLayoutCubit>(
    () => MainLayoutCubit(),
  );
  di.registerFactory<MenuItemsCubit>(
    () => MenuItemsCubit(
      di<GetMenuItemsUseCase>(),
    ),
  );
}

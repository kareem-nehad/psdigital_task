import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:psdigital_task/core/di/di.dart';
import 'package:psdigital_task/layouts/main_layout/cubit/main_layout_cubit.dart';
import 'package:psdigital_task/layouts/main_layout/main_layout_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'Home Screen',
        builder: (context, state) => BlocProvider(
          create: (context) => di<MainLayoutCubit>(),
          child: const MainLayoutScreen(),
        ),
      ),
    ],
  );
}

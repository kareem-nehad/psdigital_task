import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psdigital_task/features/menu_screen/presentation/menu_screen.dart';
import 'package:psdigital_task/features/profile_screen/presentation/profile_screen.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(const MainLayoutState(1));

  static MainLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  final List<Widget> screens = [
    const Center(child: Text('Home')),
    const MenuScreen(),
    const Center(child: Text('Cart')),
    const ProfileScreen(),
    const Center(child: Text('More')),
  ];

  void changeScreen(int index) {
    emit(MainLayoutState(index));
  }
}

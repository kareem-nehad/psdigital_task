part of 'main_layout_cubit.dart';

@immutable
class MainLayoutState extends Equatable {
  final int screenIndex;

  const MainLayoutState(this.screenIndex);

  @override
  List<Object> get props => [screenIndex];
}

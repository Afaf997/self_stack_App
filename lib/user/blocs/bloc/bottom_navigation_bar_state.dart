part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarState {}

class BottomNavigationBarInitial extends BottomNavigationBarState {
  final int tabIndex;

  BottomNavigationBarInitial({required this.tabIndex});
}

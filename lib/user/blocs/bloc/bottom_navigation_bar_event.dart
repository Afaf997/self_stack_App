part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {}

class ChangeTabIndexEvent extends BottomNavigationBarEvent {
  final int index;

  ChangeTabIndexEvent(this.index);
}


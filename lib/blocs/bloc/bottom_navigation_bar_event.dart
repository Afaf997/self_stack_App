part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarEvent {}


class ChangeTabIndexEvent extends BottomNavigationBarEvent {
  final int index;

  ChangeTabIndexEvent(this.index);
}

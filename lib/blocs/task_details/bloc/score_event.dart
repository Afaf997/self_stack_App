part of 'score_bloc.dart';

@immutable
sealed class ScoreEvent {}

class NavigationscoreEvent extends ScoreEvent {
  final int index;

  NavigationscoreEvent({required this.index});

  @override
  List<Object> get props => [index];
}
part of 'score_bloc.dart';

@immutable
sealed class ScoreState {}

final class ScoreInitial extends ScoreState {}

abstract class  scoreActionState extends ScoreState{}

class NavigationscoreState extends scoreActionState{
    final int index;

  NavigationscoreState({required this.index});
}

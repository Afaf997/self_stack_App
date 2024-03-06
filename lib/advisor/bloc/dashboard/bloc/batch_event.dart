part of 'batch_bloc.dart';

@immutable
sealed class BatchEvent {}

class NavigationEvent extends BatchEvent{}

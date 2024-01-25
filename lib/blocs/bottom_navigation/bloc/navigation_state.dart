part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

final class NavigationInitial extends NavigationState {}

 abstract class navigateActionState extends NavigationState{} 

class HomeScreenState extends NavigationState {}

class TaskScreenState extends NavigationState {}

class ScheduleScreenState extends NavigationState {}

class ProfileScreenState extends NavigationState {}

class LogoutState extends NavigationState{}
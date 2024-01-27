
// Define events
abstract class NavigationEvent{}

class NavigateToHomeEvent extends NavigationEvent {}

class NavigateToTaskEvent extends NavigationEvent {}

class NavigateToScheduleEvent extends NavigationEvent {}

class NavigateToProfileEvent extends NavigationEvent {}

class LogoutEvent extends NavigationEvent{}
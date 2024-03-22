part of 'navbar_admin_bloc.dart';

@immutable
abstract class NavbarAdminEvent {}

class NavbarIndex extends NavbarAdminEvent {
  final int indexnum;

  NavbarIndex(this.indexnum);
}
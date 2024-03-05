part of 'navbar_admin_bloc.dart';

@immutable
sealed class NavbarAdminEvent {

}
class NavbarIndex extends NavbarAdminEvent{
   final int indexnum;

   NavbarIndex(this.indexnum);
}

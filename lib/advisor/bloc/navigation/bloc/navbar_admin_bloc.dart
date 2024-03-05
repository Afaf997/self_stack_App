import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/advisor/bloc/navigation/bloc/navbar_admin_state.dart';

part 'navbar_admin_event.dart';

class NavbarAdminBloc extends Bloc<NavbarAdminEvent, NavbarAdminState> {
  NavbarAdminBloc() : super(NavbarAdminInitial(tabIndex: 0)) {
    on<NavbarAdminEvent>((event, emit) {
      on<NavbarIndex>(navbarIndex);
        
    });
  }

  FutureOr<void> navbarIndex(NavbarIndex event, Emitter<NavbarAdminState> emit) {
    emit(NavbarAdminInitial(tabIndex: event.indexnum));
  }
}

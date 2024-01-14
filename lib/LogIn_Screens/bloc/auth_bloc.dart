import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<Loginevent>(loginevent);
    on<ForgotEvent>(forgotEvent);
    on<GoogleConnectEvent>(googleConnectEvent);
    on<SignUpNavigationEvent>(signUpNavigationEvent);
  }

  FutureOr<void> loginevent(Loginevent event, Emitter<AuthState> emit) {
    
    print("login clicked");
  }

  FutureOr<void> forgotEvent(ForgotEvent event, Emitter<AuthState> emit) {
    print("forgot clicked");
    emit(ForgotActionState());
  }

  FutureOr<void> googleConnectEvent(GoogleConnectEvent event, Emitter<AuthState> emit) {
  print("google clicked");
  }

  FutureOr<void> signUpNavigationEvent(SignUpNavigationEvent event, Emitter<AuthState> emit) {
  print("sign clicked");
  emit(SignScreenActionState());
  }
}

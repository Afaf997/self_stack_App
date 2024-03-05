import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/user/services/login_service.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Loginservices dioservices = Loginservices();

  AuthBloc() : super(AuthInitial()) {
    on<Loginevent>(loginevent);
    on<ForgotEvent>(forgotEvent);
    on<GoogleConnectEvent>(googleConnectEvent);
    on<SignUpNavigationEvent>(signUpNavigationEvent);
  }

  FutureOr<void> loginevent(Loginevent event, Emitter<AuthState> emit) async {
    try {
      bool authenticated =await dioservices.authenticationModel(event.email, event.password);
      if (authenticated) {
        emit(LoginSuccessState());
      } else {
        emit(AuthErrorstate());  
      }
    } on Exception catch (e) {
      // ignore: unused_local_variable
      String errormessage = (e).toString();
      emit(AuthState.error("An error occurred. Please try again later."));
    }
  }

  FutureOr<void> forgotEvent(ForgotEvent event, Emitter<AuthState> emit) {
    emit(ForgotActionState());
  }

  FutureOr<void> googleConnectEvent(GoogleConnectEvent event, Emitter<AuthState> emit)async{

    // emit( googleAuthState());
  }

  FutureOr<void> signUpNavigationEvent(
      SignUpNavigationEvent event, Emitter<AuthState> emit) {
    emit(SignScreenActionState());
  }
}



import 'dart:async';
// import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:self_stack/pages/authentication_screen/LogIn_Screens/dio_services.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Dioservices dioservices =Dioservices();


  AuthBloc() : super(AuthInitial()) {
    on<Loginevent>(loginevent);
    on<ForgotEvent>(forgotEvent);
    on<GoogleConnectEvent>(googleConnectEvent);
    on<SignUpNavigationEvent>(signUpNavigationEvent);
  }

FutureOr<void> loginevent(Loginevent event, Emitter<AuthState> emit) async {
 try {
      
      bool authenticated = await dioservices.authenticationModel(event.email, event.password);
      if (authenticated) {
        emit(LoginSuccessState());
      } else {
        // emit(FailureState());
      }
    } on Exception catch(e){
      // ignore: unused_local_variable
      String errormessage=(e).toString();
      emit(AuthState.error("An error occurred. Please try again later."));
    }
}

  FutureOr<void> forgotEvent(ForgotEvent event, Emitter<AuthState> emit) {
    emit(ForgotActionState());
  }

  FutureOr<void> googleConnectEvent(GoogleConnectEvent event, Emitter<AuthState> emit) {
  // print("google clicked");
  }

  FutureOr<void> signUpNavigationEvent(SignUpNavigationEvent event, Emitter<AuthState> emit) {
  emit(SignScreenActionState());
  }

}
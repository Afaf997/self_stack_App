import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/user/blocs/login_bloc/bloc/auth_bloc.dart';
import 'package:self_stack/user/services/signup_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignupService signupService = SignupService();

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonEvent>(signUpButtonEvent);
    on<LoginScreenNavigationevent>(loginScreenNavigationevent);
  }

  Future<void> signUpButtonEvent(
    SignUpButtonEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      bool success = await signupService.signUpModel(
        event.name,
        event.email,
        event.password,
      );

      if (success) {
        emit(SuccessState());
      } else {
        emit(AuthState.error("Signup failed. Check your credentials."));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          log(e.response!.statusCode.toString());
        }
      }
      emit(AuthState.error("An error occurred. Please try again later."));
    }
  }

  FutureOr<void> loginScreenNavigationevent(
      LoginScreenNavigationevent event, Emitter<SignUpState> emit) {
    emit(LoginActionState());
  }
}

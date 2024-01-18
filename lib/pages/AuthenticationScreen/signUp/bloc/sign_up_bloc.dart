import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/Core/links.dart';
import 'package:self_stack/pages/AuthenticationScreen/LogIn_Screens/bloc/auth_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
  on<SignUpButtonEvent>(signUpButtonEvent);
  on<LoginScreenNavigationevent>(loginScreenNavigationevent);
  }

  FutureOr<void> signUpButtonEvent(SignUpButtonEvent event, Emitter<SignUpState> emit)async {
    Dio dio= Dio();
    var data1={
      
    "name":event.name,
    "email": event.email,
    "password": event.password,
    };
    log(data1.toString());
      try {
    final response = await dio.post(
      "$loginApi/users$apikey",
      data: jsonEncode(data1),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    log(response.statusCode.toString());
    print(response.statusCode);

    if (response.statusCode == 200) {
      emit(SuccessState());
    } else if (response.statusCode == 401) {
      if (response.data != null && response.data['error'] == 'Invalid username or password') {
        emit(AuthState.error("Invalid username or password. Please try again."));
      } else {
        emit(AuthState.error("Login failed. Check your credentials."));
      }
    }
  }on DioException catch (e){
    if (e.response!=null) {
      log(e.response!.statusCode.toString());
    }
    emit(AuthState.error("An error occurred. Please try again later."));
  }
}
  }

  FutureOr<void> loginScreenNavigationevent(LoginScreenNavigationevent event, Emitter<SignUpState> emit) {
  emit(LoginActionState());
  }
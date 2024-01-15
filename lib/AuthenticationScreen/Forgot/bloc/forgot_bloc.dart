import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotInitial()) {
   on<ForgotScreenevent>(forgotevent);
   on<ForgotinitialEvent>(forgotinitialEvent);
  }

  FutureOr<void> forgotevent(ForgotScreenevent event, Emitter<ForgotState> emit)async {
     Dio dio= Dio();
    var data2={
      
    "email": event.email,
    };
       try {
    final response = await dio.post(
      "https://flutter-self-stack-api.vercel.app/api/users?apiKey=flutterbyafaf",
      data: jsonEncode(data2),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    log(response.statusCode.toString());
    print(response.statusCode);

    if (response.statusCode == 200) {
      
      emit(SuccessForgot());
    } else if (response.statusCode == 401) {
      if (response.data != null && response.data['error'] == 'Invalid username or password') {
        // emit(ForgotState .error("Invalid username or password. Please try again."));
      } 
    }
  }on DioException catch (e){
    if (e.response!=null) {
      log(e.response!.statusCode.toString());
    }
    // emit(AuthState.error("An error occurred. Please try again later."));
  }
  }

  FutureOr<void> forgotinitialEvent(ForgotinitialEvent event, Emitter<ForgotState> emit) {
    emit(ForgotInitial());
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/core/links.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
   on<Submitevent>(submitevent);
   on<BackToOtp >(backToOtp );
  }

  FutureOr<void> submitevent(Submitevent event, Emitter<ResetPasswordState> emit)async {
    Dio dio =Dio();
  var data4={  
    "email": event.email,
    "newPassword":event.newpassword
    };
        try {
    final response = await dio.post(
      "$loginApi/users/updatePassword$apikey",
      data: jsonEncode(data4),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    log(response.statusCode.toString());
    print(response.statusCode);

    if (response.statusCode == 200) {
      emit (SuccessResetState());
    }
    else if (response.statusCode == 401) {
      if (response.data != null && response.data['error']) {
        emit( ResetPasswordState.error("Invalid otp Please try again."));
      } 
    }
     
  }on DioException catch (e){
    if (e.response!=null) {
      log(e.response!.statusCode.toString());
    }
  }
  }

  FutureOr<void> backToOtp(BackToOtp event, Emitter<ResetPasswordState> emit) {
    emit(ResetNavigateState());
  }
}

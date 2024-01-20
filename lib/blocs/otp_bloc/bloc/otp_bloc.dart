import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/core/links.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
   on<OtpVerifyevent>(otpVerifyevent);
   on<Backforgotevent >(backforgotevent);
  }

  FutureOr<void> otpVerifyevent(OtpVerifyevent event, Emitter<OtpState> emit) async{
     Dio dio= Dio();
    var data2={  
    "email": event.email,
    "otp":event.otp,
    };
       try {
    final response = await dio.post(
      "$loginApi/verifyOTP$apikey",
      data: jsonEncode(data2),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    log(response.statusCode.toString());
    print(response.statusCode);

    if (response.statusCode == 200) {
     
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
  }

  FutureOr<void> backforgotevent(Backforgotevent event, Emitter<OtpState> emit) {
  }


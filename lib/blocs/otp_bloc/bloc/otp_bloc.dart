import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
     log(event.otp);
     
    var data3={  
    "email": event.email,
    "otp":event.otp,
    };
     log(data3.toString());
       try {
    final response = await dio.post(
      "$loginApi/users/verifyOTP$apikey",
      data: jsonEncode(data3),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    log(response.statusCode.toString());
    print(response.statusCode);

    if (response.statusCode == 200) {
      emit (SuccessOtpState());
    }
     
    // } else if (response.statusCode == 401) {
    //   if (response.data != null && response.data['error'] == 'Invalid username or password') {
    //     emit(OtpState.error("Invalid username or password. Please try again."));
    //   } 
    // }
  }on DioException catch (e){
    if (e.response!=null) {
      log(e.response!.statusCode.toString());
    }
    // emit(OtpState.error("An error occurred. Please try again later."));
  }
  }
  }

  FutureOr<void> backforgotevent(Backforgotevent event, Emitter<OtpState> emit) {
    emit(OtpInitial());
  }


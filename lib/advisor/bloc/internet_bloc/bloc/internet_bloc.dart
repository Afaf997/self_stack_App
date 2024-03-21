import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;

  InternetBloc() : super(InternetInitial()) {
    on<OnConnected>((event, emit) => emit(Connected(msg: 'Connected...')));
    on<OnNotConnected>((event, emit) => emit(NotConnected(msg: 'Not Connected...')));

    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      final connectivityResult = result.isNotEmpty ? result[0] : ConnectivityResult.none;
      if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
        add(OnConnected());
      } else {
        add(OnNotConnected());
      }
    });
  }


}

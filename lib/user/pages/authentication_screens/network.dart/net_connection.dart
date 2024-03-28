import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:self_stack/user/pages/authentication_screens/home_screen/splash.dart';
import 'package:self_stack/utils/constans.dart';

class InternetConnectivitySystem extends StatelessWidget {
  const InternetConnectivitySystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: StreamBuilder<List<ConnectivityResult>>(
        stream: connectivity.onConnectivityChanged,
        builder: (_, AsyncSnapshot<List<ConnectivityResult>> snapshot) {
          return InternetConnectionWidget(snapshot: snapshot, widget:SplashScreen());
        },
      ),
    );
  }
}

class InternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<List<ConnectivityResult>> snapshot;
  final Widget widget;

  const InternetConnectionWidget({Key? key, required this.snapshot, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.active) {
      final List<ConnectivityResult>? state = snapshot.data;
      if (state == null || state.contains(ConnectivityResult.none)) {
        return Center(
          child: Container(
            height: 230,
            width: 330,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off_rounded,color: kbackgroundmodel,),
                  SizedBox(height: 10),
                  Text(
                    "Could not activate cellular data network",
                    style: TextStyle(color: kbackgroundmodel, fontSize: 21, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Turn on cellular data or use Wi-Fi to access data",
                    style: TextStyle(color: kbackgroundmodel),
                    textAlign: TextAlign.center,
                  ),
                  Divider(),

                  Center(child: Text("OK",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kblueTheme),))
                ],
              ),
            ),
          ),
        );
      } else {
        return widget;
      }
    } else {
      return SizedBox(); 
    }
  }
}

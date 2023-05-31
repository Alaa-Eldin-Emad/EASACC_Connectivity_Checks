import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../cubit/connectivity_cubit.dart';
import '../utility/showToast.dart';

class WebViewApp extends StatelessWidget {
  const WebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //Using BLOC State management to manage the code
      create: (context) => ConnectivityCubit(),
      child: BlocConsumer<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {},
        builder: (context, state) {
          ConnectivityCubit.get(context)
              .isItConnected(); //Open the stream to know if the Connectivity changed
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey.shade900,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      //Making button on the app bar to check connectivity
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () async {
                        //Once you click on the button Connectivity package checks Connectivity
                        var result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.mobile) {
                          showToast(
                              "You are connected to Mobile data"); //Mobile Data check
                        } else if (result == ConnectivityResult.wifi) {
                          showToast("You are connected to wifi"); //Wifi check
                        } else if (result == ConnectivityResult.ethernet) {
                          showToast(
                              "Your connection is from wired cable"); //Wired cable check
                        } else if (result == ConnectivityResult.bluetooth) {
                          showToast(
                              "You are connected to Bluetooth"); //Bluetooth check
                        } else if (result == ConnectivityResult.other) {
                          showToast(
                              "You are connected to other Device"); //Any other output devices check
                        } else if (result == ConnectivityResult.none) {
                          showToast(
                              "There is no connection"); //if there is nothing connected
                        }
                      },
                      child: const Text(
                        "Check Connectivity",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff263238)),
                      )),
                )
              ],
              title: const Text('EASACC Test'),
            ),
            body: WebViewWidget(
              controller: ConnectivityCubit.get(context).controller,
            ),
          );
        },
      ),
    );
  }
}

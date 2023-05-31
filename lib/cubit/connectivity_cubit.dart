import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());
  static ConnectivityCubit get(context) => BlocProvider.of(context);
  late WebViewController controller;

  void isItConnected() {
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            'https://easacc.com/'), //Open EASACC Web page using webview_flutter package
      );
    emit(ConnectivityInitial());
  }
}

import 'package:flutter/material.dart';
import 'modules/checkConnectivity.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false,
      home: WebViewApp(),
    ),
  );
}


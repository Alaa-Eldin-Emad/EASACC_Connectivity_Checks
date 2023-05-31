import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String text) => Fluttertoast.showToast(
    //Using Toast to display the checks on the screen
    msg: text,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.blueGrey.shade900,
    textColor: Colors.white,
    fontSize: 16.0);

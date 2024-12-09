
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static showToast(String message){
    Fluttertoast.showToast(
        msg:message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static showFlushBar(String title,String message,BuildContext context){
    Flushbar(
      title: title,
      titleColor: Colors.white,
      message: message,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.check,
        color: Colors.greenAccent,
      ),
      showProgressIndicator: true,
    ).show(context);
  }

}
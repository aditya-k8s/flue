import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {
  static toastMessage(String? message) {
    Fluttertoast.showToast(
        msg: message!,
        backgroundColor: Colors.indigo,
        fontSize: 20,
        toastLength: Toast.LENGTH_SHORT);
  }

  static flushBarErrorMessage(String? message, BuildContext context) {
    return showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.all(8.0),
          message: message,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 20,
          ),
        )..show(context));
  }

  static showSnakeBar(BuildContext context, String? message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message!)));
  }

  static fieldFocusNode(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static double averageRating(List<int> rating) {
    var avgRating = 0;
    for (var i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(2));
  }
}

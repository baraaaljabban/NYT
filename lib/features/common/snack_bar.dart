import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class SnackBarHelper {
  static void showLoadingSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: LoadingIndicator(),
            backgroundColor: Colors.transparent,
            duration: Duration(days: 1),
          ),
        )
        .closed
        .then((reason) {
      if (reason == SnackBarClosedReason.swipe) showLoadingSnackBar(context);
    });
  }

  static void showErrorSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ??""),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 10),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ??""),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 10),
      ),
    );
  }

  static void showWarningSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ??""),
        backgroundColor: Colors.orange,
        duration: Duration(
          seconds: 18,
        ),
      ),
    );
  }
}

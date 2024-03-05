import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppErrorWidgetBinding extends WidgetsFlutterBinding {
  @override
  void handleError(FlutterErrorDetails details) {
    // Handle the error globally, for example, show a Snackbar.
    log('Global Error Handler: ${details.exception}');

    // You can replace this with your own error message and action.
    final errorMessage = 'An error occurred. Please try again.';

    // Access the current BuildContext using the rootBundle
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(details.context! as BuildContext).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              // Perform any action on Snackbar action.
            },
          ),
        ),
      );
    });
  }
}

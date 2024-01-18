

import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class SnackbarUtils {
  static void showSuccessSnackbar(BuildContext context, String mainMessage, {String? subMessages}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text(mainMessage,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
           const SizedBox(height: 4),
            Text(
              subMessages!,
              style:const TextStyle(fontSize: 12, color:backgroundmodel),
            ),
          ],
        ),
        backgroundColor: selfstackGreen,
      ),
    );
  }

  static void showErrorSnackbar(BuildContext context, String mainMessage, {String? subMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text(mainMessage,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            if (subMessage != null) const SizedBox(height: 4),
            if (subMessage != null)
              Text(
                subMessage,
                style:const TextStyle(fontSize: 12, color: backgroundmodel),
              ),
          ],
        ),
        backgroundColor: redtheme,
      ),
    );
  }
}
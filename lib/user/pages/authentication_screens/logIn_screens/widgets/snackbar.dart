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
            Center(child: Text(mainMessage,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color:kselfstackGreen),)),
           ksizedboxA,
            Text(
              subMessages!,
              style:const TextStyle(fontSize: 12, color:kbackgroundmodel),
            ),
          ],
        ),
        backgroundColor:Color.fromARGB(255, 22, 22, 22),
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
                style:const TextStyle(fontSize: 12, color: kbackgroundmodel),
              ),
          ],
        ),
        backgroundColor: kblackLight,
      ),
    );
  }
}
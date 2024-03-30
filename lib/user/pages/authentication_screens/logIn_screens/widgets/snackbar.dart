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
            Center(
              child: Text(
                subMessages!,
                style:const TextStyle(fontSize: 12, color:kwhiteModel),
              ),
            ),
          ],
        ),
        backgroundColor:kblackDark,
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
            Center(child: Text(mainMessage,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
            if (subMessage != null) const SizedBox(height: 6),
            if (subMessage != null)
              Center(
                child: Text(
                  subMessage,
                  style:const TextStyle(fontSize: 14, color: kwhiteModel),
                ),
              ),
          ],
        ),
        backgroundColor: kredtheme,
      ),
    );
  }
}
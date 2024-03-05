import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

Color determineOnlineColor(String onlineText) {
  switch (onlineText) {
    case 'Present':
      return kselfstackGreen;
    case 'Holiday':
      return kyellow;
    case 'HalfDay':
      return kblueTheme;
    case 'Absend':
      return kredtheme;
    default:
      return kblackDark;
  }
}
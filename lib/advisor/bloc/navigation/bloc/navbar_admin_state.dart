import 'package:flutter/material.dart';

@immutable
abstract class NavbarAdminState {}

class NavbarAdminInitial extends NavbarAdminState {
  final int tabIndex;

  NavbarAdminInitial({required this.tabIndex});
}

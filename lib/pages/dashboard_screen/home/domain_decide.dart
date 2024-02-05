import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class DomainDesidePage extends StatelessWidget {
  const DomainDesidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      body: Center(
        child: Text("your didn't decide your domain",style: TextStyle(color: kwhiteModel,fontSize: 16),),
      ),
    );
  }
}
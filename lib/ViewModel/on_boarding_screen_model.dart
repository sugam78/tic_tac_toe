import 'package:flutter/material.dart';

import '../View/home_screen.dart';

class OnBoardingScreenModel {
  BuildContext context;

  OnBoardingScreenModel({required this.context});

  void onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}

import 'package:flutter/material.dart';

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

void navigateTo(context, screen) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );

void navigateToFinish(context, screen) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return screen;
    }), (route) => false);

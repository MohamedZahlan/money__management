import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[300],
  //HexColor('f9f8fe'), //Colors.grey.shade50, //myDefaultColor,
  primarySwatch: primaryColor,
  indicatorColor: greenColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: greenColor,
  ),
  fontFamily: 'quran',
  cardTheme: const CardTheme(),
  appBarTheme: AppBarTheme(
    color: Colors.grey[300], //myDefaultColor,
    elevation: 0.0,
    shadowColor: Colors.white,
    titleSpacing: 0,
    //toolbarHeight: 120.h,
    actionsIconTheme: const IconThemeData(
      size: 30,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(color: greenColor),
    titleTextStyle: const TextStyle(
      fontFamily: 'Quicksand-Bold',
      color: Colors.black, //myDefaultColor,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300],
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, //Colors.white, //Colors.white
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: myDefaultColor,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'quran',

      color: greenColor, //Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
    ),
    bodyMedium: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
    titleMedium: const TextStyle(
      fontFamily: 'me_quran',
      color: Colors.white, //Colors.black,
      fontWeight: FontWeight.w900,
      fontSize: 18.0,
      // height: 1.5,
    ),
    titleSmall: const TextStyle(
      color: Colors.white, //Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 15.0,
      height: 1.5,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.grey,
    fontFamily: 'Jannah',
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      titleSpacing: 20,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white10, elevation: 10.0),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    )),
    unselectedWidgetColor: Colors.black,
    indicatorColor: Colors.white);

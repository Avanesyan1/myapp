import 'package:flutter/material.dart';
import 'package:shopping_app/global/const.dart';

class MyTheme{
  ThemeData light(){
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: white
      ),
      scaffoldBackgroundColor: white,
      textTheme: TextTheme(
        bodySmall: bf14w400,
        bodyMedium: bf16w400,
        headlineLarge: bf32w600,
        headlineSmall: bf14w600 ,
        headlineMedium: bf24w600
      ),
      
      primaryColor: white244,
      hintColor: black,
    );
  }
  ThemeData dark(){
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: dark1
      ),
      scaffoldBackgroundColor: dark1,
      textTheme: TextTheme(
        bodyMedium: wf16w400,
        bodySmall: wf14w400,
        headlineLarge: wf32w600,
        headlineSmall: wf14w600, 
        headlineMedium: wf24w600
      ),
     
      primaryColor: dark2,
      hintColor: white
    );
  }
}
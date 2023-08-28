import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyThemeData{

  static const Color primaryGreen = Color(0xFF39A552);

 static ThemeData lightTheme = ThemeData(
   textTheme: TextTheme(
     bodySmall: TextStyle(
       fontSize: 12,
       color: Colors.grey[700],
     ),
       bodyMedium: TextStyle(
         fontSize: 15,
         color: Colors.black,
         fontWeight: FontWeight.w500
       ),
     displayMedium: TextStyle(
       fontSize: 25,
       fontWeight: FontWeight.bold,
       color: Colors.white
     ),
     labelMedium: TextStyle(
         fontSize: 22,
         fontWeight: FontWeight.bold,
         color: Color(0xFF4F5A69)
     )
   ),
   primaryColor: primaryGreen,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      color: primaryGreen,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50)
        )
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    ),
   bottomSheetTheme: BottomSheetThemeData(
     backgroundColor: Colors.white,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
     )
   )
  );
}
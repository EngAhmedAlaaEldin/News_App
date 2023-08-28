import 'package:flutter/material.dart';

class AppConfigLocale extends ChangeNotifier{

  String locale = 'en';

  changeLang(String newLang)async{
    if(locale == newLang)return;
    locale = newLang;
    notifyListeners();
  }
}
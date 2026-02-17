import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManager {
  static late SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  static saveTheme(ThemeMode newMode){
    if(newMode==ThemeMode.dark){
      sharedPreferences.setString("theme", "dark");
    }
    else{
      sharedPreferences.setString("theme", "light");
    }
  }
  static getTheme(){
    String value= sharedPreferences.getString("theme")??"light";
    if(value=="dark"){
      return ThemeMode.dark;
    }
    else{
      return ThemeMode.light;
    }
  }
}
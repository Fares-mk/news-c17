import 'package:flutter/material.dart';
import 'package:news_c17/core/remote/local/memory_manager.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode mode= ThemeMode.light;
  void initTheme(){
    mode= MemoryManager.getTheme();
    notifyListeners();
  }
  void changeTheme(ThemeMode newMode){
    mode=newMode;
    MemoryManager.saveTheme(newMode);
    notifyListeners();
  }

}
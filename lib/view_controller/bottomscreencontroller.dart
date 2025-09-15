import 'package:flutter/material.dart';

class BottomController with ChangeNotifier{
  int currentIndex=0;
  String? currentTime=DateTime.now().toString();


  void updateTime() {
    currentTime = DateTime.now().toString();
    notifyListeners();
  }



  void selectscreen(int index){
    currentIndex=index;
        notifyListeners();
  }


    String? dropdownvalue;

    void setdropdownvalue(String value){
      dropdownvalue=value;
      notifyListeners();
    }

    String? selectedYesNo;

  void setselectedYesNo(String value){
    selectedYesNo=value;
    notifyListeners();
  }
}
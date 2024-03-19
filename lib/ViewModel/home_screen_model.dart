
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenModel extends GetxController{
  RxList<String> mode = ['','','','','','','','',''].obs;
  RxInt count = 0.obs;
  Rx color = Colors.blue.obs;
  RxString won= 'z'.obs;
  String onTap(int i){
    count.value++;
    if(mode[i]==''){
      if(count%2==0){
        mode[i] = 'o';
      }
      else{
        mode[i]= 'x';
      }
    }
    if(gameWon()){
      won.value = mode[i];
      resetState();
    }
    if(count.value==9){
      won.value = "Draw";
      resetState();
    }
    debugPrint(count.value.toString());
    return won.value;
  }
  void resetState(){
    mode = ['','','','','','','','',''].obs;
    count.value = 0;
  }
  bool gameWon(){
    bool c1 = mode[0]==mode[1]&&mode[1]==mode[2]&&mode[0]!='';
    bool c2 = mode[0]==mode[3]&&mode[3]==mode[6]&&mode[0]!='';
    bool c3 = mode[0]==mode[4]&&mode[4]==mode[8]&&mode[0]!='';
    bool c4 = mode[3]==mode[4]&&mode[4]==mode[5]&&mode[4]!='';
    bool c5 = mode[6]==mode[7]&&mode[7]==mode[8]&&mode[7]!='';
    bool c6 = mode[6]==mode[4]&&mode[4]==mode[2]&&mode[4]!='';
    bool c7 = mode[1]==mode[4]&&mode[4]==mode[7]&&mode[7]!='';
    bool c8 = mode[2]==mode[5]&&mode[5]==mode[8]&&mode[5]!='';
    if(count.value < 5){
      return false;
    }
    if(c1||c2||c3||c4||c5||c6||c7||c8){
      return true;
    }
    return false;
  }

}
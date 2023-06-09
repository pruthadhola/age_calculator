import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyController extends ChangeNotifier
{
  DateTime ? selectDate;
  DateTime today_date=DateTime.now();
  int day=0;
  int hr=0;
  int min=0;
  int second=0;
  double month=0;
  double year=0;

  age_select(BuildContext context)
  async {
   DateTime? picked_date= await showDatePicker(context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2000),
       lastDate: DateTime(2024));
   if(picked_date!=null && picked_date!=selectDate){
     selectDate=picked_date;
   }


   day=today_date.difference(selectDate!).inDays;
   hr=today_date.difference(selectDate!).inHours;
   min=today_date.difference(selectDate!).inMinutes;
   second=today_date.difference(selectDate!).inSeconds;

   if(day%30==0){
     month=(today_date.month - selectDate!.month) + year*12;
   }else{
     month=double.parse((day/30).toStringAsFixed(2));
   }


   if(month%12==0){
     year= (today_date.year - selectDate!.year) as double;
   }else{
     year = double.parse((month/12).toStringAsFixed(2));
   }


   notifyListeners();
  }
}
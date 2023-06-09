import 'package:age_calculator/Mycontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MaterialApp(home: ChangeNotifierProvider(
    create: (context) => MyController(),
    child: Home(),)));
}
class Home extends StatelessWidget {
  DateTime Today_date=DateTime.now();

  @override
  Widget build(BuildContext context) {
    MyController m= Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),
      body: Column(
        children: [

          Text("Select Date:"),
          ElevatedButton(onPressed: () {
          m.age_select(context);
          }, child: Text("Select Date")),
          Expanded(
            child: ListView(children: [
              Card(child: Text("Today Date:$Today_date"),),
              Card(child: Text("Birthdate=${m.selectDate}")),
              Card(child: Text("Year=${m.year}")),
              Card(child: Text("Month=${m.month}")),
              Card(child: Text("Day=${m.day}")),
              Card(child: Text("Hour=${m.hr}")),
              Card(child: Text("Min=${m.min}")),
              Card(child: Text("Second=${m.second}")),
            ],),
          ),

         

        ],
      ),
    );
  }
}

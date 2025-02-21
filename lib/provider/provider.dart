import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/date_format.dart';
import 'package:todo_app/firebase/task_model.dart';

import '../screens/settings.dart';
import '../screens/tasks_List.dart';

class ProviderService extends ChangeNotifier{
  String? uid ;
  ThemeMode themeMode =ThemeMode.dark;
  List<Widget> widgets =[const TaskList(),const Settings()];
  int index =0;
  DateTime currentDate =DateTime.now();


  timePicker(BuildContext context) async{

    var currentdate =await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365*2)));
    if(currentdate!=null){
      currentDate =currentdate;
      notifyListeners();
    }
    return;
  }
  changeTheme(ThemeMode x){
    if(x == themeMode) return;
    themeMode = x;
    notifyListeners();
  }
  bool isDark(){
    return themeMode ==ThemeMode.dark;
  }


}
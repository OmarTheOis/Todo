import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/provider.dart';
import 'package:todo_app/themes/theme_controll.dart';

configLoading(BuildContext context){
  var vm = Provider.of<ProviderService>(context);
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = ThemeController.primaryColor
    ..backgroundColor = vm.isDark()? Colors.black: Colors.white
    ..indicatorColor = ThemeController.primaryColor
    ..textColor = Colors.yellow
    ..userInteractions = true
    ..dismissOnTap = false;

}
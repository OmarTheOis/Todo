import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/date_format.dart';
import 'package:todo_app/firebase/firebase_utils.dart';
import 'package:todo_app/provider/provider.dart';

import 'firebase/task_model.dart';

class TimePicker extends StatefulWidget {
  TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ProviderService>(context);
    return EasyInfiniteDateTimeLine(
      controller: _controller,
      firstDate: DateTime.now(),
      focusDate: vm.currentDate,
      lastDate: DateTime.now().add(const Duration(days: 732)),
      showTimelineHeader: false,
      onDateChange: (selectedDate) {
        vm.currentDate = selectedDate;
        setState(() {});
      },
      dayProps: EasyDayProps(
        height: 90,
        todayHighlightStyle: TodayHighlightStyle.withBackground,
        inactiveDayStyle: DayStyle(
            dayNumStyle:  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: vm.isDark()? Colors.white:Colors.black,),
            dayStrStyle:  TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: vm.isDark()? Colors.white:Colors.black),
            monthStrStyle:  TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: vm.isDark()? Colors.white:Colors.black),
            decoration: BoxDecoration(
          color: vm.isDark()? Color(0xFF141922):Colors.white,
          borderRadius: BorderRadius.circular(5),
        )),
        activeDayStyle: DayStyle(
            monthStrStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white),
            dayStrStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,),
            decoration: BoxDecoration(
                color: const Color(0xFF5D9CEC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.white))),
        todayStyle: DayStyle(
            dayNumStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5D9CEC)),
            dayStrStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5D9CEC)),
            monthStrStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5D9CEC)),
            decoration: BoxDecoration(
              color: vm.isDark()? Color(0xFF141922):Colors.white,
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }

}

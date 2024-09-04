import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/home/task_list/task_list_title.dart';
import 'package:to_do_project/providers/list_provider.dart';

class TaskLsitTab extends StatefulWidget {
  @override
  State<TaskLsitTab> createState() => _TaskLsitTabState();
}

class _TaskLsitTabState extends State<TaskLsitTab> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if (listProvider.taskList.isEmpty) {
      listProvider.getAllTasksFromFireStore();
    }
    return Container(
      child: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              listProvider.changeSelectedDate(selectedDate);
            },
            headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff3371FF),
                      Color(0xff8426D6),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: listProvider.taskList.isEmpty
                ? Text(
                    'No Tasks asdded',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return TaskListItem(
                        task: listProvider.taskList[index],
                      );
                    },
                    itemCount: listProvider.taskList.length,
                  ),
          )
        ],
      ),
    );
  }
}

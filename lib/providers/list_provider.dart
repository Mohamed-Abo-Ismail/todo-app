import 'package:flutter/foundation.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> taskList = [];
  var SelectDate = DateTime.now();

  void getAllTasksFromFireStore() async {
    var querySnapshot = await FirebaseUtils.getTasksCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task) {
      if (SelectDate.day == task.dateTime.day &&
          SelectDate.month == task.dateTime.month &&
          SelectDate.year == task.dateTime.year) {
        return true;
      }
      return false;
    }).toList();

    taskList.sort((task1, task2) {
      return task1.dateTime.compareTo(task2.dateTime);
    });

    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate) {
    SelectDate = newDate;
    getAllTasksFromFireStore();
  }
}

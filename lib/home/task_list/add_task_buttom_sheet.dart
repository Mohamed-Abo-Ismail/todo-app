import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/firebase_utils.dart';
import 'package:to_do_project/model/task.dart';
import 'package:to_do_project/providers/list_provider.dart';

class AddTaskkButtomSheet extends StatefulWidget {
  static final formKey = GlobalKey<FormState>();

  @override
  State<AddTaskkButtomSheet> createState() => _AddTaskkButtomSheetState();
}

class _AddTaskkButtomSheetState extends State<AddTaskkButtomSheet> {
  String title = '';
  String description = '';
  var selectDate = DateTime.now();
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.add_new_task,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Form(
                key: AddTaskkButtomSheet.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Enter Task Title'),
                        onChanged: (text) {
                          title = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task title';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Enter Task Description'),
                        onChanged: (text) {
                          description = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task description';
                          }
                          return null;
                        },
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Select Date',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          showCalender();
                        },
                        child: Text(
                            '${selectDate.day}/${selectDate.month}/'
                            '${selectDate.year}',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addTask();
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {
    if (AddTaskkButtomSheet.formKey.currentState?.validate() == true) ;
    {
      Task task =
          Task(title: title, description: description, dateTime: selectDate);
      FirebaseUtils.addTaskToFireStore(task).timeout(Duration(seconds: 1),
          onTimeout: () {
        print('task added successffully');
        listProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    selectDate = chosenDate ?? selectDate;
    setState(() {});
  }
}

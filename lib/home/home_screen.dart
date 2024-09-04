import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_project/appColors.dart';
import 'package:to_do_project/home/settings_list/settings_tap.dart';
import 'package:to_do_project/home/task_list/add_task_buttom_sheet.dart';
import 'package:to_do_project/home/task_list/task_list_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.2,
          title: Text(AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
              selectedItemColor: AppColors.primaryColor,
              showUnselectedLabels: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icon_list.png")),
                    label: AppLocalizations.of(context)!.task_list),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icon_settings.png")),
                    label: AppLocalizations.of(context)!.settings)
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.white, width: 4)),
          onPressed: () {
            addTaskButtonShhet();
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: selectedIndex == 0 ? TaskLsitTab() : SettingsTab());
  }

  void addTaskButtonShhet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskkButtomSheet());
  }
}

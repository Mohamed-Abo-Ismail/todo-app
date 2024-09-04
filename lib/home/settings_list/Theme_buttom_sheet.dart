import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../appColors.dart';
import '../../providers/app_config_provider.dart';

class ThemeButtomSheet extends StatefulWidget {
  @override
  State<ThemeButtomSheet> createState() => _ThemeButtomSheetState();
}

class _ThemeButtomSheetState extends State<ThemeButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.appTheme == ThemeMode.light
                      ? getSelectedItemWidget(
                          AppLocalizations.of(context)!.light)
                      : getUnSelectedItemWidget(
                          AppLocalizations.of(context)!.light),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.appTheme == ThemeMode.dark
                      ? getSelectedItemWidget(
                          AppLocalizations.of(context)!.dark)
                      : getUnSelectedItemWidget(
                          AppLocalizations.of(context)!.dark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: TextStyle(fontSize: 23)
                .copyWith(color: AppColors.primaryColor)),
        Icon(
          Icons.check,
          size: 10,
          color: Colors.blue,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: TextStyle(fontSize: 23));
  }
}

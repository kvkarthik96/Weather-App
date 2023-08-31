import 'package:flutter/material.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/widgets/app_exit_alert.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';
import 'package:weather_app/ui/widgets/error_widget.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showAppExitAlert(context);
        return false;
      },
      child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppWidgets.appBarWidget(
              title: 'Weather App', onPressed: () {}, isBackButton: false),
          body: const ShowErrorWidget()),
    );
  }
}

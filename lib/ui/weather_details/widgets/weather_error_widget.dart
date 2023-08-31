import 'package:flutter/material.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';
import 'package:weather_app/ui/widgets/error_widget.dart';

class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppWidgets.appBarWidget(
          title: "Weather Details",
          onPressed: () {
            Navigator.pop(context);
          }),
      body: const ShowErrorWidget(),
    );
  }
}

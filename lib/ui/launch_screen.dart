import 'package:weather_app/res/route_const.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacementNamed(routeHomeScreen);
    });

    super.initState();
  }

  navigateTo() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red])),
      child: const Center(
          child: LabelText(
              text: 'Welcome to Weather App',
              fontWeight: FontWeight.bold,
              size: 22,
              color: kWhiteColor)),
    ));
  }
}

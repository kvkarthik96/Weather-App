import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/widgets/app_exit_alert.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

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
        body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                        color: Colors.grey[400],
                        width: double.infinity,
                        height: 100.h),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

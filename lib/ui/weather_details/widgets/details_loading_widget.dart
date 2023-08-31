import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/res/image_const.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';

class DetailsLoadingWidget extends StatelessWidget {
  const DetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppWidgets.appBarWidget(
          title: 'Weather Details',
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade400,
        child: Container(
          width: 1.sw,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.getDefaultSizedBox(height: 20),
              ShimmerContainer(height: 45, width: 0.5.sw),
              AppWidgets.getDefaultSizedBox(height: 10),
              ShimmerContainer(height: 45, width: 0.5.sw),
              AppWidgets.getDefaultSizedBox(height: 10),
              ShimmerContainer(height: 20, width: 0.3.sw),
              AppWidgets.getDefaultSizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ShimmerContainer(height: 45, width: 0.3.sw),
                    AppWidgets.getDefaultSizedBox(height: 10),
                    ShimmerContainer(height: 20, width: 0.3.sw),
                    SizedBox(
                        height: 120.h,
                        width: 120.h,
                        child: Image.asset(ImageConst.cloud2Image)),
                    ShimmerContainer(height: 20, width: 0.3.sw),
                  ],
                ),
              ),
              AppWidgets.getDefaultSizedBox(height: 30),
              ShimmerContainer(height: 70.h, width: double.infinity),
              AppWidgets.getDefaultSizedBox(height: 20),
              ShimmerContainer(height: 70.h, width: double.infinity),
              AppWidgets.getDefaultSizedBox(height: 20),
              ShimmerContainer(height: 70.h, width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  const ShimmerContainer({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
    );
  }
}

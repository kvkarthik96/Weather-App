import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';

class WeatherWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final Orientation orientation;
  const WeatherWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.desc,
      required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: orientation == Orientation.portrait ? double.infinity : 0.3.sw,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(
          horizontal: orientation == Orientation.portrait ? 25.w : 10.w,
          vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image,
              height: orientation == Orientation.portrait ? 60.h : 50.h),
          LabelText(
            text: title,
            size: 18,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          LabelText(
            text: desc,
            size: 18,
            textAlign: TextAlign.end,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}

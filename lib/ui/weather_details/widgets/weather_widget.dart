import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';

class WeatherWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const WeatherWidget({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image, height: 60.h),
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

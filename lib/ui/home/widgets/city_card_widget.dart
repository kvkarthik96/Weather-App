import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';

class CityCardWidget extends StatelessWidget {
  final String cityName;
  final Function() onTap;
  const CityCardWidget({
    super.key,
    required this.cityName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(text: cityName, size: 16, fontWeight: FontWeight.w600),
            const Icon(Icons.arrow_forward_ios, size: 18)
          ],
        ),
      ),
    );
  }
}

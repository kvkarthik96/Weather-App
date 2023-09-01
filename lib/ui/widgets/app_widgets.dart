import 'package:flutter/material.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';

class AppWidgets {
  // Common app abr used throught the app
  static appBarWidget(
      {required String title,
      required Function() onPressed,
      isBackButton = true,
      List<Widget>? actions,
      bool isLeading = true}) {
    return AppBar(
      elevation: 0,
      backgroundColor: kWhiteColor,
      centerTitle: false,
      title: Row(children: [
        LabelText(
            text: title,
            color: kBlackColor,
            size: 17,
            fontWeight: FontWeight.w700)
      ]),
      leading: isLeading
          ? IconButton(
              onPressed: onPressed,
              icon: Icon(isBackButton ? Icons.arrow_back : Icons.menu),
              color: kBlackColor)
          : const SizedBox(height: 0, width: 0),
      leadingWidth: !isLeading ? 20.w : null,
      actions: actions,
    );
  }

  // Used this widget for vertical spacing
  static getDefaultSizedBox({double height = 12}) {
    return SizedBox(height: height.h);
  }

  static noDataFoundWidget({String message = "No Data Found"}) {
    return Expanded(
      child: Center(
        child: LabelText(
          text: message,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

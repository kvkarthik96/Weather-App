import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/res/image_const.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';
import 'package:weather_app/ui/weather_details/bloc/details_bloc.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';

import 'widgets/details_loading_widget.dart';
import 'widgets/weather_error_widget.dart';
import 'widgets/weather_widget.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String selectedCity;
  const WeatherDetailsScreen({super.key, required this.selectedCity});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  DetailsBloc detailsBloc = DetailsBloc();

  @override
  void initState() {
    detailsBloc.add(GetWeatherDetailsEvent(widget.selectedCity));

    super.initState();
  }

  @override
  void dispose() {
    detailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      bloc: detailsBloc,
      builder: (context, state) {
        if (state is DetailsLoadingState) {
          return const DetailsLoadingWidget();
        } else if (state is DetailsLoadedState) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppWidgets.appBarWidget(
                title: "Weather Details",
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.getDefaultSizedBox(height: 20),
                  LabelText(
                      text:
                          '${state.response.location?.name}, \n${state.response.location?.region}',
                      size: 33,
                      fontWeight: FontWeight.normal,
                      color: kBlackColor),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  LabelText(
                    text: '${state.response.location?.localtime}',
                    size: 14,
                    color: kTertiaryColor,
                  ),
                  AppWidgets.getDefaultSizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        LabelText(
                          text: '${state.response.current?.tempC}°C',
                          size: 50,
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        LabelText(
                          text:
                              '( Feels like ${state.response.current?.feelslikeC}°C )',
                          size: 14,
                          color: kTertiaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                            height: 120.h,
                            width: 120.h,
                            child: CachedNetworkImage(
                                imageUrl:
                                    'https:${state.response.current?.condition?.icon}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover))),
                                errorWidget: (context, url, _) => Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: Image.asset(ImageConst.cloud2Image)),
                                placeholder: (context, url) => Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child:
                                        Image.asset(ImageConst.cloud2Image)))),
                        LabelText(
                          text: '${state.response.current?.condition?.text}',
                          size: 18,
                          color: kBlackColor,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                  AppWidgets.getDefaultSizedBox(height: 30),
                  WeatherWidget(
                    title: 'Cloud',
                    desc: "${state.response.current?.cloud}%",
                    image: ImageConst.cloudImage,
                  ),
                  WeatherWidget(
                    title: 'Wind',
                    desc: "${state.response.current?.windKph} km/h",
                    image: ImageConst.windImage,
                  ),
                  WeatherWidget(
                    title: 'Humidity',
                    desc: "${state.response.current?.humidity}%",
                    image: ImageConst.humidityImage,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const WeatherErrorWidget();
        }
      },
    );
  }
}

import 'package:weather_app/res/route_const.dart';
import 'package:weather_app/ui/home/home_screen.dart';
import 'package:weather_app/ui/launch_screen.dart';
import 'package:weather_app/ui/utils/texts/label_text.dart';
import 'package:weather_app/ui/weather_details/weather_details_screen.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? args;

    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case routeDefault:
        return MaterialPageRoute(builder: (_) => const LaunchScreen());

      case routeHomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case routeWeatherDetailsScreen:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) => WeatherDetailsScreen(
                    selectedCity: args!['selectedCity'],
                  ));
        } else {
          return _errorRoute(settings.name);
        }

      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(pageName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.error_outline),
              AppWidgets.getDefaultSizedBox(),
              LabelText(
                text: errPageText + pageName.toString(),
                size: 16,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/res/color_const.dart';
import 'package:weather_app/res/route_const.dart';
import 'package:weather_app/ui/home/bloc/home_bloc.dart';
import 'package:weather_app/ui/widgets/app_exit_alert.dart';
import 'package:weather_app/ui/widgets/app_widgets.dart';

import 'widgets/city_card_widget.dart';
import 'widgets/city_search_widget.dart';
import 'widgets/home_error_widget.dart';
import 'widgets/home_loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();

  final searchKey = GlobalKey<FormFieldState>();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    homeBloc.add(GetCitiesListEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToDetailsScreenState) {
          Navigator.of(context).pushNamed(routeWeatherDetailsScreen,
              arguments: {'selectedCity': state.selectedCity});
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const HomeLoadingWidget();
        } else if (state is HomeLoadedState) {
          return WillPopScope(
            onWillPop: () async {
              showAppExitAlert(context);
              return false;
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                backgroundColor: kBackgroundColor,
                appBar: AppWidgets.appBarWidget(
                    title: 'Weather App',
                    onPressed: () {},
                    isBackButton: false),
                body: Column(
                  children: [
                    AppWidgets.getDefaultSizedBox(),
                    CitySearchWidget(
                        searchController: searchController,
                        homeBloc: homeBloc,
                        allCityList: state.allCityList),
                    state.citiesList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: state.citiesList.length,
                                itemBuilder: (context, index) {
                                  return CityCardWidget(
                                    cityName: state.citiesList[index],
                                    onTap: () {
                                      homeBloc.add(NavigateToDetailsScreenEvent(
                                          state.citiesList[index]));
                                    },
                                  );
                                }),
                          )
                        : AppWidgets.noDataFoundWidget(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const HomeErrorWidget();
        }
      },
    );
  }
}

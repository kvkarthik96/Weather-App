import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/home/bloc/home_bloc.dart';

// ignore: must_be_immutable
class CitySearchWidget extends StatelessWidget {
  CitySearchWidget(
      {super.key,
      required this.searchController,
      required this.homeBloc,
      required this.allCityList,
      required this.debounceTimer});

  final TextEditingController searchController;
  final HomeBloc homeBloc;
  final List<String> allCityList;
  Timer debounceTimer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TextField(
          controller: searchController,
          onChanged: (value) {
            value = value.trim();
            if (debounceTimer.isActive) debounceTimer.cancel();

            const Duration debounceDuration =
                Duration(milliseconds: 500); // Set debounce time
            debounceTimer = Timer(debounceDuration, () {
              homeBloc.add(SearchCityEvent(
                  allCityList: allCityList,
                  searchText: searchController.text.trim()));
            });
          },
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintText: 'Search City',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.cancel_outlined),
                color: Colors.grey,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  searchController.clear();
                  homeBloc.add(SearchCityEvent(
                      allCityList: allCityList,
                      searchText: searchController.text.trim()));
                },
              ))),
    );
  }
}

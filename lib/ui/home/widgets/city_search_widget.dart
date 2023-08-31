import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/home/bloc/home_bloc.dart';

class CitySearchWidget extends StatefulWidget {
  const CitySearchWidget({
    super.key,
    required this.searchController,
    required this.homeBloc,
    required this.allCityList,
  });

  final TextEditingController searchController;
  final HomeBloc homeBloc;
  final List<String> allCityList;

  @override
  State<CitySearchWidget> createState() => _CitySearchWidgetState();
}

class _CitySearchWidgetState extends State<CitySearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TextField(
          controller: widget.searchController,
          onChanged: (value) {
            value = value.trim();

            widget.homeBloc.add(SearchCityEvent(
                allCityList: widget.allCityList,
                searchText: widget.searchController.text.trim()));
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
                  widget.searchController.clear();
                  widget.homeBloc.add(SearchCityEvent(
                      allCityList: widget.allCityList,
                      searchText: widget.searchController.text.trim()));
                },
              ))),
    );
  }
}

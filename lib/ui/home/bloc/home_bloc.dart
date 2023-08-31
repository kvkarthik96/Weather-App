import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/remote/service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<GetCitiesListEvent>(getCitiesList);
    on<SearchCityEvent>(searchCityEvent);
    on<NavigateToDetailsScreenEvent>(navigateToDetailsScreenEvent);
  }

  Future<FutureOr<void>> getCitiesList(
      GetCitiesListEvent event, Emitter<HomeState> emit) async {
    Service service = Service();

    List<String> citiesList = [];

    try {
      emit(HomeLoadingState());

      citiesList = await service.getCitiesList();

      emit(HomeLoadedState(citiesList: citiesList, allCityList: citiesList));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  FutureOr<void> searchCityEvent(
      SearchCityEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    List<String> citiesList = [];
    for (int i = 0; i < event.allCityList.length; i++) {
      if (event.allCityList[i]
          .toLowerCase()
          .contains(event.searchText.toLowerCase())) {
        citiesList.add(event.allCityList[i]);
      }
    }

    emit(HomeLoadedState(
        citiesList: citiesList, allCityList: event.allCityList));
  }

  FutureOr<void> navigateToDetailsScreenEvent(
      NavigateToDetailsScreenEvent event, Emitter<HomeState> emit) {
    emit(HomeActionInitialState());
    emit(NavigateToDetailsScreenState(event.selectedCity));
  }
}

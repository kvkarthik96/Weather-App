part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCitiesListEvent extends HomeEvent {}

class SearchCityEvent extends HomeEvent {
  final List<String> allCityList;
  final String searchText;

  const SearchCityEvent({required this.allCityList, required this.searchText});
}

class NavigateToDetailsScreenEvent extends HomeEvent {
  final String selectedCity;

  const NavigateToDetailsScreenEvent(this.selectedCity);
}

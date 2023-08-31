part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeActionState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<String> allCityList;
  final List<String> citiesList;

  const HomeLoadedState({required this.citiesList, required this.allCityList});
}

final class HomeErrorState extends HomeState {}

final class HomeActionInitialState extends HomeActionState {}

final class NavigateToDetailsScreenState extends HomeActionState {
  final String selectedCity;

  NavigateToDetailsScreenState(this.selectedCity);
}

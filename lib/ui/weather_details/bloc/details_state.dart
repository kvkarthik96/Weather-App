part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitialState extends DetailsState {}

final class DetailsLoadingState extends DetailsState {}

final class DetailsLoadedState extends DetailsState {
  final WeatherModel response;

  const DetailsLoadedState(this.response);
}

final class DetailsErrorState extends DetailsState {}

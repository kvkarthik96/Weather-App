import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/remote/service.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsLoadingState()) {
    on<GetWeatherDetailsEvent>(getWeatherDetailsEvent);
  }

  Future<FutureOr<void>> getWeatherDetailsEvent(
      GetWeatherDetailsEvent event, Emitter<DetailsState> emit) async {
    Service service = Service();

    WeatherModel response = WeatherModel();

    try {
      getWeatherData() async {
        await service.getWeatherDetails(event.cityName).then((res) {
          response = res;
        });
      }

      emit(DetailsLoadingState());
      await getWeatherData();
      emit(DetailsLoadedState(response));
    } catch (e) {
      emit(DetailsErrorState());
    }
  }
}

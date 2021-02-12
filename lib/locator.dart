import 'package:get_it/get_it.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';

import 'api/weather_api_client.dart';
import 'repo/weather_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
}

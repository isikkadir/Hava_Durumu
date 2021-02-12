import 'package:flutter/material.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repo/weather_repository.dart';

enum WeatherState { InitialState, LoadingState, LoadedState, ErrorState }

class WeatherViewModel with ChangeNotifier {
  WeatherState _state;
  WeatherRepository _repository = locator<WeatherRepository>();
  Weather _getirilenHava;

  WeatherViewModel() {
    _getirilenHava = Weather();
    _state = WeatherState.InitialState;
  }

  Weather get getirilenHava => _getirilenHava;

  WeatherState get state => _state;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Future<Weather> havaDurumunuGetir(String sehirAdi) async {
    try {
      state = WeatherState.LoadingState;
      _getirilenHava = await _repository.getWeather(sehirAdi);
      state = WeatherState.LoadedState;
    } catch (e) {
      state = WeatherState.ErrorState;
      print("Hata çıktı HavaDurumunuGetir " + e.toString());
    }
    return _getirilenHava;
  }

  Future<void> havaDurumunuGuncelle(String secilenSehir) async {
    try {
      _getirilenHava = await _repository.getWeather(secilenSehir);
      state = WeatherState.LoadedState;
    } catch (e) {}
    return _getirilenHava;
  }
}

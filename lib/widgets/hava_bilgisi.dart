import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';

class HavaBilgisi extends StatelessWidget {
  WeatherViewModel _weatherViewModel;
  String stateName;
  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    stateName =
        _weatherViewModel.getirilenHava.consolidatedWeather[0].weatherStateName;
    return Center(
      child: Text(
        stateName,
        style: TextStyle(fontSize: 40.0),
      ),
    );
  }
}

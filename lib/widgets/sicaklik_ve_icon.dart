import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';

class SicaklikveIcon extends StatelessWidget {
  String IconUrl = "https://www.metaweather.com/static/img/weather/png/";
  String abbr;
  WeatherViewModel _weatherViewModel;
  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var yeniSicaklik =
        _weatherViewModel.getirilenHava.consolidatedWeather[0].maxTemp;
    print(yeniSicaklik.toString());
    abbr =
        _weatherViewModel.getirilenHava.consolidatedWeather[0].weatherStateAbbr;
    IconUrl = IconUrl + abbr + ".png";
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            yeniSicaklik.floor().toString() + "°",
            style: TextStyle(fontSize: 70),
          ),
          Image.network(
            IconUrl,
            height: 120,
            width: 120,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';

class SehirveTarih extends StatelessWidget {
  WeatherViewModel _weatherViewModel;
  DateTime tarih;
  String sehirAdi;
  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    sehirAdi = _weatherViewModel.getirilenHava.title;
    tarih =
        _weatherViewModel.getirilenHava.consolidatedWeather[0].applicableDate;

    return Center(
      child: Column(
        children: [
          Text(
            sehirAdi,
            style: TextStyle(fontSize: 36.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            DateFormat.yMd().format(tarih),
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';

class SonrakiGunler extends StatelessWidget {
  WeatherViewModel _weatherViewModel;
  var sonraki_bir_temp;
  var sonraki_iki_temp;
  var sonraki_uc_temp;
  var sonrakiBirUrl = "https://www.metaweather.com/static/img/weather/png/";
  var sonrakiIkiUrl = "https://www.metaweather.com/static/img/weather/png/";
  var sonrakiUcUrl = "https://www.metaweather.com/static/img/weather/png/";
  DateTime tarih;
  var tarih2;
  var tarih3;
  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    sicaklikIcon();
    tarihgetir();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    tarihDegistir(tarih),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    sonraki_bir_temp.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              Image.network(
                sonrakiBirUrl,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    tarihDegistir(tarih2),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    sonraki_iki_temp.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              Image.network(
                sonrakiIkiUrl,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    tarihDegistir(tarih3),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    sonraki_uc_temp.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              Image.network(
                sonrakiUcUrl,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void tarihgetir() {
    tarih = tarih2 =
        _weatherViewModel.getirilenHava.consolidatedWeather[0].applicableDate;
    tarih2 =
        _weatherViewModel.getirilenHava.consolidatedWeather[1].applicableDate;
    tarih3 =
        _weatherViewModel.getirilenHava.consolidatedWeather[2].applicableDate;
  }

  void sicaklikIcon() {
    sonraki_bir_temp =
        _weatherViewModel.getirilenHava.consolidatedWeather[1].theTemp.floor();
    sonraki_iki_temp =
        _weatherViewModel.getirilenHava.consolidatedWeather[2].theTemp.floor();
    sonraki_uc_temp =
        _weatherViewModel.getirilenHava.consolidatedWeather[3].theTemp.floor();
    print("sonraki temp" + sonraki_bir_temp.toString());
    sonrakiBirUrl = sonrakiBirUrl +
        _weatherViewModel
            .getirilenHava.consolidatedWeather[1].weatherStateAbbr +
        ".png";
    sonrakiIkiUrl = sonrakiIkiUrl +
        _weatherViewModel
            .getirilenHava.consolidatedWeather[2].weatherStateAbbr +
        ".png";
    sonrakiUcUrl = sonrakiUcUrl +
        _weatherViewModel
            .getirilenHava.consolidatedWeather[3].weatherStateAbbr +
        ".png";
  }

  String tarihDegistir(DateTime tarih) {
    String yeniTarihKisaltmasi;
    String output = DateFormat('EEEEE', 'en_US').format(tarih);
    switch (output) {
      case "Monday":
        yeniTarihKisaltmasi = "Mon";
        return yeniTarihKisaltmasi;

      case "Tuesday":
        yeniTarihKisaltmasi = "Tue";
        return yeniTarihKisaltmasi;

      case "Thursday":
        yeniTarihKisaltmasi = "Thu";
        return yeniTarihKisaltmasi;

      case "Friday":
        yeniTarihKisaltmasi = "Fri";
        return yeniTarihKisaltmasi;

      case "Saturday":
        yeniTarihKisaltmasi = "Sat";
        return yeniTarihKisaltmasi;

      case "Sunday":
        yeniTarihKisaltmasi = "Sun";
        return yeniTarihKisaltmasi;
    }
  }
}

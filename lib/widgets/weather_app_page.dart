import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';
import 'package:weather_app/widgets/sehir_sec.dart';

import 'hava_bilgisi.dart';
import 'sehir_ve_tarih.dart';
import 'sicaklik_ve_icon.dart';
import 'sonraki_günler.dart';

class WeatherApp extends StatelessWidget {
  String secilenSehir;
  WeatherViewModel _weatherViewModel;
  String lastUpdated;
  DateTime tarih;
  Completer<void> _refreshIndicator = Completer<void>();

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    tarih = _weatherViewModel.getirilenHava.time;
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              secilenSehir = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SehirSec()));
              print("Tıklandı boş state" + secilenSehir);
              _weatherViewModel.havaDurumunuGetir(secilenSehir);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: (_weatherViewModel.state == WeatherState.LoadedState)
                ? anaEkran(context)
                : (_weatherViewModel.state == WeatherState.LoadingState)
                    ? Center(child: LoadingWidget())
                    : (_weatherViewModel.state == WeatherState.ErrorState)
                        ? errorWidget()
                        : Center(
                            child: Text("Sehir Seçin"),
                          ),
          ),
        ),
      ),
    );
  }

  Widget anaEkran(BuildContext context) {
    secilenSehir = _weatherViewModel.getirilenHava.title;
    _refreshIndicator.complete();
    _refreshIndicator = Completer();
    return RefreshIndicator(
      onRefresh: () {
        _weatherViewModel.havaDurumunuGuncelle(secilenSehir);
        return _refreshIndicator.future;
      },
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: SehirveTarih(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: SicaklikveIcon(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: HavaBilgisi(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: SonrakiGunler(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 100,
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                child: Text(
                  "Last Updated " +
                      TimeOfDay.fromDateTime(tarih).format(context),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget LoadingWidget() {
    return CircularProgressIndicator();
  }

  errorWidget() {
    return Text("Hava durumu getirilirken hata olustu");
  }
}

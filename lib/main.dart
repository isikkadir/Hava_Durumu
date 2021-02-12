import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/viewmodels/weather_view_model.dart';
import 'package:weather_app/widgets/weather_app_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeatherApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => locator<WeatherViewModel>(),
        child: WeatherApp(),
      ),
    );
  }
}

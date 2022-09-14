import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:weather_app/models/src/app_settings.dart';
import 'package:weather_app/page/page_container.dart';
import 'package:weather_app/styles.dart';

void main() {
  AppSettings settings = AppSettings();

  // Don't allow landscape mode
  runApp(MyApp(settings: settings));
}

class MyApp extends StatelessWidget {
  final AppSettings settings;

  const MyApp({Key key, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: "Cabin",
      primaryColor: AppColor.midnightSky,
      accentColor: AppColor.midnightCloud,
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
    );

    /*
    fi
    final width = MediaQuery.of(context) this will return a referrance to the nearest object of type MediaQuery .size.width * 0.8
    buildContext context 
    Theme.of(context).fontFamily = 'sans seri
    context.theme
    context.MediaQuery



    */

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: PageContainer(settings: settings),
    );
  }
}

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('the weather app')),
      body: Container(
          alignment: Alignment.center, child: Text('weather app body')),
    );
  }
}

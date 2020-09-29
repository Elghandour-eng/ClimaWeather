import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';
import 'loading_screen.dart';
import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:clima/services/location.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.WeatherData});
  final WeatherData;
  //double celcuis =tempeture -273.15;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
@override
int condition;
int tempeture;
String cityname;
int tEmp;
Location location =Location();
LoadingScreen loadingScreen =LoadingScreen();
WeatherModel weatherModel =new WeatherModel();
  void initState() {
    // TODO: implement initState
    super.initState();

    weather(widget.WeatherData);
  }
  void weather(dynamic data){
condition =jsonDecode(data)['weather'][0]['id'];
tempeture =jsonDecode(data)['main']['temp'];
 //tEmp=tempeture.toInt();
cityname=jsonDecode(data)['name'];

 print(data);
  }

  @override

  Widget build(BuildContext context) {
    weather(widget.WeatherData);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weathearData=await weatherModel.getWeatherData();
                      weather(weathearData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context){return CityScreen();}));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Text(
                        tempeture.toString(),
                        style: kTempTextStyle,
                      ),
                    ),
                    Text(
                      '${weatherModel.getWeatherIcon(condition)}️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  " ${weatherModel.getMessage(tempeture) } in $cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

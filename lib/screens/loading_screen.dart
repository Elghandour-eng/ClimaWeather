import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  double longitude;
  double lonitude;
  void initState(){
    super.initState();
    getlocationData();
  }

  void getlocationData() async {

WeatherModel weatherModel =WeatherModel();
 var weather =await weatherModel.getWeatherData();

     Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(WeatherData: weather,);}));


  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
      ),
    );
  }
}

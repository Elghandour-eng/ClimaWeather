import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longtudt;

 Future<void> getCurrentLocation() async{
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude =position.latitude;
      longtudt=position.longitude;

    }catch(e){
      print(e);
    }

  }
}
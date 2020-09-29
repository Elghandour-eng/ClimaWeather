import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class NetworkingHelper{
NetworkingHelper(this.url);
  final String url;

  Future getdata() async{
    Response response = await get(url);
    String data =response.body;
    return data;


  }

}
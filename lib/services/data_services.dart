import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataServices {
  Future<List<dynamic>> getUsers() async { //MVC (Module View Controller)
    var info = rootBundle.loadString("json/data.json");
    List<dynamic> list = json.decode(await info);//Future parameter which needs await and needs to return the datatype for the return type

    return Future.delayed(
        const Duration(seconds: 1),
        () => list //return function within one line
            .map((e) => e)
            .toList()); //map function to return the data as a list
  }
}

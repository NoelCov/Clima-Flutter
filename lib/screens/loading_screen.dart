import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    double longitude = location.longitude;
    double latitude = location.latitude;

    print('This is the longitude: $longitude');
    print('This is the latitude: $latitude');
  }

  void getData() async {
    http.Response response =
        await http.get(Uri.https('https://API.com', '/path to what we want'));

    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

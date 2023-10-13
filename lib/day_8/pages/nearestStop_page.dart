// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NearestStop extends StatefulWidget {
  const NearestStop({super.key});

  @override
  State<NearestStop> createState() => _NearestStopState();
}

class _NearestStopState extends State<NearestStop> {
  Location location = Location();
  double? latitude, longitude;

  @override
  void initState() {
    super.initState();
    _checkLocationService();
    _getCurrentLocation();
  }

  Future<void> _checkLocationService() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Handle the case where the user declined the location request.
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationData currentLoc = await location.getLocation();
      setState(() {
        latitude = currentLoc.latitude;
        longitude = currentLoc.longitude;
      });
      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Nearest Bus Stop'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black87),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            color: Colors.amber.withOpacity(0.2),
            child: Column(children: [
              const Text('This is where we are now!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20)),
              const SizedBox(height: 25),
              SizedBox(
                  height: 300,
                  width: 300,
                  child: Container(
                      color: Colors.green.withOpacity(0.2),
                      child: GoogleMap(
                          onTap: (argument) => print(''),
                          initialCameraPosition: const CameraPosition(
                              target: LatLng(1.378725, 103.943961), zoom: 15))))
            ])));
  }
}

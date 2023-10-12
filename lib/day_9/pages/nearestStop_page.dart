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
  Set<Marker> markers = {};

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

        // Add market for user's location
        markers.add(Marker(
            markerId: const MarkerId('userLocation'),
            position: LatLng(latitude!, longitude!),
            infoWindow: const InfoWindow(title: 'You are here!')));
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
            child: Column(children: [
              const SizedBox(height: 25),
              SizedBox(
                  height: 300,
                  width: 300,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        child: (latitude != null && longitude != null)
                            ? GoogleMap(
                                onTap: (argument) => print(''),
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(latitude!, longitude!),
                                    zoom: 17),
                                markers: markers)
                            : const Center(
                                child:
                                    CircularProgressIndicator()), //Show a loading indicator until the location is fetched
                      )))
            ])));
  }
}

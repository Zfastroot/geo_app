import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition intialCameraPosition =
      CameraPosition(target: LatLng(31.7917, 7.0926), zoom: 3);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User current location"),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition: intialCameraPosition,
          markers: markers,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await _deteminePostion();

            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));

            markers.clear();

            markers.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));

            setState(() {});
          },
          label: const Text("Current Location"),
          icon: const Icon(Icons.location_on),
        ));
  }

  Future<Position> _deteminePostion() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are desible');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied ");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied permently  denied");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}

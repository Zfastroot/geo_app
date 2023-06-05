import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({super.key});

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(31.7917, 7.0926), zoom: 4.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Navigation Map"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GoogleMap(
              initialCameraPosition: initialPosition,
              mapType: MapType.terrain,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ],
        ));
  }
}

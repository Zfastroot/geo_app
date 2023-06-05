import 'package:flutter/material.dart';
import 'package:geo_app/screens/current_location_screen.dart';
import 'package:geo_app/screens/nearby_places_screen.dart';
// import 'package:geo_app/screens/polyline_screen.dart';
import 'package:geo_app/screens/simple_map_screen.dart';
import 'package:geo_app/screens/search_places_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoLocator Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          SizedBox(
            height: 250, // Adjust the height of the logo container as needed
            child: Image.asset(
                'assets/logo.png'), // Replace 'path_to_your_logo.png' with the actual path to your logo image file
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SimpleMapScreen();
                }));
              },
              child: const Text("     Navigation Map     ")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const CurrentLocationScreen();
                }));
              },
              child: const Text("User current location ")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchPlacesScreen();
                }));
              },
              child: const Text(" Search places ")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const NearByPlacesScreen();
                }));
              },
              child: const Text("Near by Places")),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (BuildContext context) {
          //         return const PolylineScreen();
          //       }));
          //     },
          //     child: const Text("Polyline between 2 points"))
        ]),
      ),
    );
  }
}

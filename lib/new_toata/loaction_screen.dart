import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocation() async {
    try {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // Do something with the position, like updating UI or sending to server
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      // Handle any errors that occur during getting the location
      print('Error getting location: $e');
    }
  }

   @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Other widgets in your app
        Positioned(
          bottom: 16.0, // Adjust bottom margin as needed
          right: 16.0, // Adjust right margin as needed
          child: FloatingActionButton(
            onPressed: getLocation,
            child: Icon(Icons.location_on),
            backgroundColor: Colors.blue, // Set background color if needed
            foregroundColor: Colors.white, // Set foreground (icon) color if needed
            elevation: 4.0, // Set elevation if needed
          ),
        ),
      ],
    );
  }
}
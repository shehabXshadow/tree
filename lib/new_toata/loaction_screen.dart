import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String apiKey = 'bd6ae96d12ad4c34a25110900240604'; // Replace with your actual WeatherAPI API key
  double? latitude;
  double? longitude;
  double? temperatureMax;
  double? temperatureMin;
  double? precipitation;

  void getLocation() async {
    try {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // Update state with the current latitude and longitude
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });

      // Fetch weather data using the obtained latitude and longitude
      getWeatherData();
    } catch (e) {
      // Handle any errors that occur during getting the location
      print('Error getting location: $e');
    }
  }

  void getWeatherData() async {
    if (apiKey != null && latitude != null && longitude != null) {
      // Construct the URL for the WeatherAPI forecast endpoint
      String url =
          'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$latitude,$longitude&days=1&aqi=no&alerts=no';

      // Make the HTTP request
      http.Response response = await http.get(Uri.parse(url));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        var data = jsonDecode(response.body);

        // Access temperature and precipitation data from the 'forecast' field
        if (data.containsKey('forecast')) {
          var forecastData = data['forecast'];

          // Access today's forecast data
          var todayForecast = forecastData['forecastday'][0];

          // Access today's temperature data
          var dayData = todayForecast['day'];

          temperatureMax = dayData['maxtemp_c']?.toDouble();
          temperatureMin = dayData['mintemp_c']?.toDouble();
          precipitation = dayData['totalprecip_mm']?.toDouble();

          // Check if temperature and precipitation values are valid
          if (temperatureMax != null && temperatureMin != null && precipitation != null) {
            // Print the temperature and precipitation data
            print('Temperature Max: $temperatureMax°C');
            print('Temperature Min: $temperatureMin°C');
            print('Precipitation: $precipitation mm');
          } else {
            print('Temperature or precipitation data is missing or invalid');
          }
        } else {
          print('Forecast data is missing in the response');
        }
      } else {
        // Print an error message if the request was unsuccessful
        print('Failed to get weather data: ${response.statusCode}');
      }
    } else {
      print('API key or location data is missing.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (temperatureMax != null)
              Text(
                'Temperature Max: ${temperatureMax!.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            if (temperatureMin != null)
              Text(
                'Temperature Min: ${temperatureMin!.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            if (precipitation != null)
              Text(
                'Precipitation: ${precipitation!.toStringAsFixed(1)} mm',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getLocation,
              child: Text('Get Weather Data'),
            ),
          ],
        ),
      ),
    );
  }
}

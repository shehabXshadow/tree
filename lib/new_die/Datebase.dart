import 'package:flutter/material.dart';

class NewDie extends StatefulWidget {
  @override
  new_die createState() => new_die();
}

class new_die extends State<NewDie> {
  String? selectedPlant;
  String? selectedSoilType;
  String? temperatureMax;
  String? temperatureMin;
  String? precipitation;
  String? historyFrom; // New variable for history from date
  String? historyTo; // New variable for history to date
  String? selectedPlantType; // New variable for selected plant type

  List<String> plantOptions = [
    'Barley',
    'Cotton',
    'DryBean',
    'Maize',
    'PaddyRice',
    'Potato',
    'Quinoa',
    'Sorghum',
    'Soybean',
    'SugarBeet',
    'SugarCane',
    'Sunflower',
    'Tomato',
    'Wheat',
    'Teff',
    'Cassava',
    'Gress'
  ];

  List<String> soilTypeOptions = [
    'Clay',
    'ClayLoam',
    'Loam',
    'LoamySand',
    'Sand',
    'SandyClay',
    'SandyClayLoam',
    'SandyLoam',
    'Silt',
    'SiltClayLoam',
    'SiltLoam',
    'SiltClay',
    'Paddy'
  ];

  List<String> plantTypeOptions = ['type 1', 'type 2', 'type 3', 'type 4'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Database',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Plant Type dropdown
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Plant Type',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text: selectedPlantType ?? '',
                    ),
                    onTap: () {
                      _showOptionsDialog(context, 'Select Plant Type', plantTypeOptions);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showOptionsDialog(context, 'Select Plant Type', plantTypeOptions);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Plant dropdown
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Plant',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text: selectedPlant ?? '',
                    ),
                    onTap: () {
                      _showOptionsDialog(context, 'Select Plant', plantOptions);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showOptionsDialog(context, 'Select Plant', plantOptions);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Soil type dropdown
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Soil Type',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text: selectedSoilType ?? '',
                    ),
                    onTap: () {
                      _showOptionsDialog(context, 'Select Soil Type', soilTypeOptions);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showOptionsDialog(context, 'Select Soil Type', soilTypeOptions);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Temperature Max TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Temperature Max',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    temperatureMax = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Temperature Min TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Temperature Min',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    temperatureMin = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Precipitation TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Precipitation',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    precipitation = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            // History From TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'History From (YYYY/MM/DD)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    historyFrom = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            // History To TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'History To (YYYY/MM/DD)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    historyTo = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Use selected values button
            ElevatedButton(
              onPressed: () {
                printSelectedValues();
              },
              child: Text('Use Selected Values'),
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, String title, List<String> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: options.map((String option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      if (title == 'Select Plant') {
                        selectedPlant = option;
                      } else if (title == 'Select Soil Type') {
                        selectedSoilType = option;
                      } else if (title == 'Select Plant Type') {
                        selectedPlantType = option; // Set selected plant type
                      }
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void printSelectedValues() {
    print('Selected Plant Type: $selectedPlantType'); // Print selected plant type
    print('Selected Plant: $selectedPlant');
    print('Selected Soil Type: $selectedSoilType');
    print('Temperature Max: $temperatureMax');
    print('Temperature Min: $temperatureMin');
    print('Precipitation: $precipitation');
    print('History From: $historyFrom');
    print('History To: $historyTo');
  }
}

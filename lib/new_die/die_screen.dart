import 'package:flutter/material.dart';

class NewDie extends StatefulWidget {
  @override
  new_die createState() => new_die();
}

class new_die extends State<NewDie> {
  String? selectedPlant; // Declare selectedPlant variable
  String? selectedSoilType; // Declare selectedSoilType variable
  String? moistureValue;
  String? temperatureValue;//// Declare moistureValue variable

  List<String> plantOptions = ['Tomato', 'Potato', 'Carrot', 'Nothing']; // Options for plant Dropdown
  List<String> soilTypeOptions = ['Clay', 'Loam', 'Sand', 'Silt']; // Options for soil type Dropdown

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
            // Moisture TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Moisture',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    moistureValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Temperature TextFormField
            Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Temperature',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    temperatureValue = value;
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
    print('Selected Plant: $selectedPlant');
    print('Selected Soil Type: $selectedSoilType');
    print('Moisture Value: $moistureValue');
    print('Temperature Value: $temperatureValue');
  }
}

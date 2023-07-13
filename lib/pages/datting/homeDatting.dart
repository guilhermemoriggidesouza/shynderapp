import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shynder/pages/datting/matches.dart';
import 'package:shynder/pages/datting/datting.dart';
import 'package:shynder/service/userPosition.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Location location = new Location();
  LocationData? _locationData;
  UserPositionService userPositionService = new UserPositionService();
  int _selectedIndex = 0;
  getLocation() async {
    _locationData = await location.getLocation();
    print(_locationData);
  }

  List<Widget> _widgetOptions = <Widget>[
    Datting(),
    Matches()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // getLocation();
    // userPositionService.sendPositionUser();
    print(_widgetOptions.elementAt(_selectedIndex));
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Na sua área',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

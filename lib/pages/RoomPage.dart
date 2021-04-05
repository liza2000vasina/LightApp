import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liza/entity/Device.dart';
import 'package:liza/pages/parts/LightPage.dart';
import 'package:liza/pages/parts/PowerPage.dart';
import 'package:liza/pages/parts/SchedulePage.dart';

class RoomPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const RoomPage({Key key, this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  int _currentIndex = 0;
  List<Widget> roomSettings = [
    PowerPage(),
    LightPage(),
    SchedulePage(),
  ];
  Device currentDevice;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var devices = widget.arguments['devices'] as List<Device>;
    currentDevice = devices[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('Room name'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink, Colors.white])),
        ),
        actions: [
          DropdownButton<Device>(
            value: currentDevice,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 24,
            elevation: 16,
            onChanged: (Device newValue) {
              setState(() {
                currentDevice = newValue;
              });
            },
            dropdownColor: Colors.pinkAccent,
            underline: Container(),
            items: devices.map<DropdownMenuItem<Device>>((Device value) {
              return DropdownMenuItem<Device>(
                value: value,
                child: Text(
                  value.name,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
      body: roomSettings[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.power),
            label: 'Power',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Light',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Schedule",
          ),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.pinkAccent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liza/constants/Routes.dart';
import 'package:liza/entity/Room.dart';
import 'package:liza/service/SharedPreferences.dart';

import 'RoomPage.dart';

class RoomsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  List<Room> rooms = [];

  @override
  Widget build(BuildContext context) {
    initRooms();
    return Scaffold(
        appBar: AppBar(
          title: Text('Rooms'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pink, Colors.white])),
          ),
        ),
        body: GridView.builder(
          itemCount: rooms.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          padding: EdgeInsets.all(5),
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink[100]),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Routes.ROOM, arguments: {
                      'devices' : rooms[index].devices
                    });
              },
              child: Center(
                child: new GridTile(
                  child: new Text(
                    rooms[index].name,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ));
  }

  initRooms() async {
    var value = await SharedPreferencesService.getJsons("rooms");
    setState(() {
      rooms = value == null
          ? []
          : value.map<Room>((e) => Room.fromJson(e)).toList();
    });
  }
}

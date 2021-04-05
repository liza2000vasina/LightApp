import 'package:flutter/material.dart';
import 'package:liza/constants/Routes.dart';
import 'package:liza/pages/RoomPage.dart';
import 'package:liza/pages/RoomsPage.dart';
import 'package:liza/pages/SettingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pink, Colors.white])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.SETTINGS);
                  },
                  child: Text(
                    'Settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(230, 100),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.ROOMS);
                  },
                  child: Text(
                    'Rooms',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(230, 100),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      onGenerateRoute: (route) {
        switch (route.name) {
          case Routes.HOME:
            return MaterialPageRoute(builder: (_) => HomePage());
          case Routes.SETTINGS:
            return MaterialPageRoute(builder: (_) => SettingsPage());
          case Routes.ROOMS:
            return MaterialPageRoute(builder: (_) => RoomsPage());
          case Routes.ROOM:
            return MaterialPageRoute(builder: (_) => RoomPage(arguments: route.arguments));
          default:
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}

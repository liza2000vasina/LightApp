import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PowerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PowerPageState();
}

class _PowerPageState extends State<PowerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 120,
        icon: Icon(
          Icons.power_settings_new_rounded,
          color: Colors.blueGrey[400],
        ),
        onPressed: () {},
      ),
    );
  }
}

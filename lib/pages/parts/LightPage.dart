import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class LightPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  int brightness = 20;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: CircleColorPicker(
              initialColor: Colors.pinkAccent,
              onChanged: (color) => print(color),
              size: const Size(300, 300),
              strokeWidth: 4,
              thumbSize: 36,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Column(
            children: [
              SliderTheme(
                data: SliderThemeData(),
                child: Slider(
                  value: brightness.toDouble(),
                  min: 0,
                  max: 100,
                  divisions: 20,
                  activeColor: Colors.pinkAccent,
                  label: brightness.toString(),
                  onChanged: (val) {
                    brightness = val.toInt();
                    // _currentTemperatureValue = val;
                    setState(() {});
                  },
                ),
              ),
              Text(
                "Brightness",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../config/textStyle.dart';

class ColorDropdown extends StatefulWidget {
  const ColorDropdown({super.key});

  @override
  _ColorDropdownState createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  Color? _selectedColor;

  @override
  Widget build(final BuildContext context) {
    return DropdownButton<Color>(
      hint: Text('SELECT COLOR',style: textStyleInterMedium14,),
      value: _selectedColor,
      onChanged: (final Color? color) {
        setState(() {
          _selectedColor = color;
        });
      },
      items: <Color>[
        Colors.red,
        Colors.green,
        Colors.blue,
      ].map<DropdownMenuItem<Color>>((final Color color) {
        return DropdownMenuItem<Color>(
          value: color,
          child: Container(
            width: MediaQuery.of(context).size.width/5,
            height: 20,
            color: color,
          ),
        );
      }).toList(),
    );
  }
}
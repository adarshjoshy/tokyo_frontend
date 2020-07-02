import 'package:flutter/material.dart';

class MoodsSelector extends StatefulWidget {

  @override
  _MoodsSelectorState createState() => _MoodsSelectorState();
}

class _MoodsSelectorState extends State<MoodsSelector> {
  List<bool> isSelected = [ false,false,false,false,true];
  int prevIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedColor: Colors.pink,
        borderColor: Colors.transparent,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Icon(
            Icons.sentiment_very_dissatisfied,
            size: 36,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.sentiment_dissatisfied,
              size: 36,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.sentiment_neutral,
              size: 36,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.sentiment_satisfied,
              size: 36,
            ),
          ),
          Icon(
            Icons.sentiment_very_satisfied,
            size: 36,
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            isSelected[prevIndex] = !isSelected[prevIndex];
            isSelected[index] = !isSelected[index];
            prevIndex = index;
          });
        },
      ),
    );
  }
}
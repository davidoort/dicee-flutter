import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void _onDicePress(String diceSide) {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
    print('$diceSide button pressed!');
  }

  Widget clickableDie(String dieSide) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: FlatButton(
          padding: EdgeInsets.zero,
          child: dieSide == 'Right' ? Image.asset('images/dice$rightDiceNumber.png') : Image.asset('images/dice$leftDiceNumber.png'),
          onPressed: () => _onDicePress(dieSide),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          clickableDie('Left'),
          clickableDie('Right')
        ],
      ),
    );
  }
}

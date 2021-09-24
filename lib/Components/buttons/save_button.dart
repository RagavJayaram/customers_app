import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function saveChanges;
  SaveButton({this.saveChanges});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: RaisedButton(
        onPressed: () => saveChanges(),
        color: Colors.purple[800],
        child: Text('Confirm',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

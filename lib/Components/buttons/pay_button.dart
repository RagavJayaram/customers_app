import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final Function pay;
  PayButton({this.pay});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: RaisedButton(
        onPressed: () => pay(),
        color: Colors.purple[800],
        child: Text('Pay',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

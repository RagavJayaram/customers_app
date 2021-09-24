import 'package:flutter/material.dart';

class ReportChangeCard extends StatefulWidget {
  Function generateReport;
  ReportChangeCard({this.generateReport, Key key}) : super(key: key);
  @override
  _ReportChangeCardState createState() => _ReportChangeCardState();
}

class _ReportChangeCardState extends State<ReportChangeCard> {
  String option = 'Unit';
  String fromdate;
  String todate;

  Widget build(BuildContext context) {
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Text(
            'Select Your Choice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: const Text('Unit Statement'),
          leading: Radio(
            value: 'Unit',
            groupValue: option,
            onChanged: (value) {
              setState(() {
                option = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Premium Paid Statement'),
          leading: Radio(
            value: 'Premium',
            groupValue: option,
            onChanged: (value) {
              setState(() {
                option = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 40),
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'From Date', hintText: 'DD/MM/YYYY'),
              onChanged: (value) => fromdate = value),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 40),
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'To Date', hintText: 'DD/MM/YYYY'),
              onChanged: (value) => todate = value),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    child: RaisedButton(
                      onPressed: () {
                        widget.generateReport(
                            this.option, this.fromdate, this.todate);
                      },
                      color: Colors.purple[800],
                      child: Text('Generate',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

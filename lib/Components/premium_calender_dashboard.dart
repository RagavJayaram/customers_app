import '../Screens/policyList/monthly_policy_list.dart';

import '../Screens/prem_list.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class PremiumDashboard extends StatefulWidget {
  @override
  _PremiumDashboardState createState() => _PremiumDashboardState();
}

class _PremiumDashboardState extends State<PremiumDashboard> {
  double totalPremium = 0;
  List<bool> isPressed = [];

  List<Widget> monthsGridBuilder() {
    List<Widget> monthsWidgetList = [];
    for (int i = 0; i < 12; i++) {
      isPressed.add(false);
    }
    for (int i = 0; i < 12; i++) {
      Widget d = FlatButton(
          //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              // return PremList(
              //   month: i,
              // );
              return MonthlyPolicyList(
                choice: -2,
                month: i,
              );
            }));
          },
          color: colorsList[i],
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    monthsList[i],
                    style: TextStyle(fontSize: 30,color: Colors.white),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(monthPremiumList[i].toString(),style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ));
      monthsWidgetList.add(d);
    }
    return monthsWidgetList;
  }

  double addTotalPremium() {
    double total = 0;
    for (int i = 0; i < 12; i++) {
      total += monthPremiumList[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            //padding: EdgeInsets.all(8),
            child: GridView.count(
              primary: false,
              //padding: const EdgeInsets.all(20),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: monthsGridBuilder(),
            ),
          ),
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Total premium: ' + addTotalPremium().toString(),
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
            color: Colors.purple[900],
          ),
        ],
      ),
    );
  }
}

class MonthClass {
  String monthName;
  double monthPremium;
  MonthClass(this.monthName, this.monthPremium);
}

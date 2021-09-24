import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:insuranceproject2/Components/footer.dart';
import 'package:insuranceproject2/Screens/ProfilePage.dart';
import '../Components/premium_calender_dashboard.dart';
import '../Components/drawer.dart';
import 'dashboard.dart';

class PremCalender extends StatefulWidget {
  @override
  _PremCalenderState createState() => _PremCalenderState();
}

class _PremCalenderState extends State<PremCalender> {
  @override
  Widget build(BuildContext context) {
    bool scrollVisible = true;
    return Scaffold(

      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.purple[700],
            child: Column(
              children: [
                //Text('Premium Calender'),
                //Text('of'),
                Text(
                  'In Force Policies',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                )
              ],
            ),
          ),
          PremiumDashboard(),
        ],
      ),
      floatingActionButton: BoomMenu(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        //child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        scrollVisible: scrollVisible,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          MenuItem(
            child: Icon(Icons.dashboard_outlined, color: Colors.white),
            title: "Dashboard",
            titleColor: Colors.white,
            subtitle: "Dashboard view",
            subTitleColor: Colors.white,
            backgroundColor: Colors.purple[800],
            onTap: () =>   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridDashboard()),
            ),
          ),


          MenuItem(
            child: Icon(Icons.account_circle, color: Colors.white),
            title: "Profile",
            titleColor: Colors.white,
            subtitle: "You Can View your Profile",
            subTitleColor: Colors.white,
            backgroundColor: Colors.purple[700],
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(

                    ))),
          ),
          MenuItem(
            child: Icon(Icons.logout, color: Colors.white),
            title: "Logout",
            titleColor: Colors.white,
            subtitle: "Logout this user",
            subTitleColor: Colors.white,
            backgroundColor: Colors.purple[600],
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );
  }
}

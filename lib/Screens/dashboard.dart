import 'package:flutter/material.dart';
import 'package:insuranceproject2/Components/footer.dart';
import 'package:insuranceproject2/Screens/addressChange/address_change_policy_list.dart';
import 'package:insuranceproject2/Screens/policy_list.dart';
import 'package:insuranceproject2/Screens/service_request_list.dart';

class GridDashboard extends StatelessWidget {


  var color = 0xff7b1fa2;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),


    body:  GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16,top: 10),
          crossAxisCount: 2,
          crossAxisSpacing: 5,

          mainAxisSpacing: 18,

          children: [
         InkWell    (
           onTap: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => PolicyList(

                     )));
           },
           child:Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/policies.png",
                    width: 42,

                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                   "Policy List",
                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                ],
              ),
            ),),
            InkWell    (
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceRequestList()));

              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/service.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Service Request",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => AddressChangePolicyList()));
    //
    // },
    },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/address.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Address Change",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
                print('Hellow');
              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/frequency.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Frequency Change",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
                print('Hellow');
              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/bank.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Bank Change",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
                print('Hellow');
              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/quote.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Surrender Quote",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
                print('Hellow');
              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/report.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Report Generation",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
                print('Hellow');
              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/top.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Top-up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),
            InkWell    (
              onTap: (){
                print('Hellow');
              },
              child:Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/redirect.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                        "Premium Redirection",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),



                  ],
                ),
              ),),

          ]
    ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),
    ); }

  }


class Items {
  String title;
  String subtitle;
  String event;
  String img;
  IconButton icon;
  Items({this.title, this.subtitle, this.event, this.img,this.icon});
}
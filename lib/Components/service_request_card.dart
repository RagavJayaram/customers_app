import 'package:flutter/material.dart';
import '../Components/custom_appbar.dart';

import 'package:slimy_card/slimy_card.dart';

import 'footer.dart';

class ServiceRequestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppBar("SR request Details", '', '', Size.fromHeight(100)),
        body: StreamBuilder(
          // This streamBuilder reads the real-time status of SlimyCard.
          initialData: false,
          stream: slimyCard.stream, //Stream of SlimyCard
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(height: 100),

                // SlimyCard is being called here.
                SlimyCard(
                  // In topCardWidget below, imagePath changes according to the
                  // status of the SlimyCard(snapshot.data).
                  topCardWidget: topCardWidget(),
                  bottomCardWidget: bottomCardWidget(),
                  color: Colors.purple[900],
                  bottomCardHeight: 250,
                ),
              ],
            );
          }),
        ),
      bottomNavigationBar: BottomAppBar(child: Container(child: Footer())),

    );
  }

  Widget topCardWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RAVISH',
                          style: TextStyle(fontSize: 18,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget bottomCardWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SR request no: ',
                  style: TextStyle(color: Colors.lightGreenAccent, fontSize: 15),
                ),
                Text(
                  '35489144562156',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(color: Colors.lightGreenAccent, fontSize: 15),
                ),
                Text(
                  ' Pending',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Date: ',
                  style: TextStyle(color: Colors.lightGreenAccent, fontSize: 15),
                ),
                Text(
                  ' 01/01/2021',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End Date: ',
                  style: TextStyle(color: Colors.lightGreenAccent, fontSize: 15),
                ),
                Text(
                  ' 02/02/2021',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color Color1 = Color.fromRGBO(146, 132, 110, 1);
const Color Color2 = Color.fromRGBO(194, 183, 168, 0.6);
const Color Color3 = Color.fromRGBO(226, 221, 212, 0.3);
//const Color mainColor = Color(0xFF92846E);

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final String username;
  final String month;
  CustomAppBar(
    this.title,
    this.username,
    this.month,
    this.preferredSize, {
    Key key,
  }) : super(key: key);

  Widget util(String field) {
    if (field.isNotEmpty) {
      return Text(
        field,
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
      );
    }
    return Container();
  }

  Widget returnContent() {
    if (username.isEmpty) {
      return util(title);
    } else if (month.isEmpty) {
      return Column(
        children: [
          util(title),
          util('for'),
          util(username),
        ],
      );
    } else {
      return Column(
        children: [
          util(title),
          util('of'),
          util(username),
          util('$month 2021')
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(top: 35),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                focusColor: Colors.amberAccent,
                hoverColor: Colors.amberAccent,
                backgroundColor: Colors.purple[900],
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text(
            //       title,
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 25,
            //           fontWeight: FontWeight.w600),
            //     ),
            //     username.isNotEmpty ? util('of') : SizedBox.shrink(),
            //     util(username),
            //     month.isNotEmpty ? util('$month 2021') : SizedBox.shrink(),
            //   ],
            // ),
            returnContent(),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/810/profiles/19338/profileImage/profile-square-extra-small.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Column(
// children: [
// SizedBox(
// height: 35,
// ),
// FloatingActionButton(
// onPressed: () {
// Navigator.pop(context);
// },
// elevation: 0,
// focusColor: Color2,
// hoverColor: Color2,
// backgroundColor: Color1,
// child: Icon(
// Icons.arrow_back,
// size: 30,
// color: Colors.white,
// ),
// )
// ],
// ),
// Expanded(
// flex: 3,
// child: Container(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// SizedBox(
// height: 35,
// ),
// Text(
// title,
// style: TextStyle(
// color: Colors.white,
// fontSize: 25,
// fontWeight: FontWeight.w600),
// ),
// // util(username),
// // util("$month 2021")
// //                      SizedBox(
// //                        height: 35,
// //                      ),
// ],
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: <Widget>[
// SizedBox(
// height: 40,
// ),
// Container(
// width: 45,
// height: 45,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// image: NetworkImage(
// "https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/810/profiles/19338/profileImage/profile-square-extra-small.png"),
// fit: BoxFit.fill),
// ),
// ),
// SizedBox(
// height: 5,
// ),
// Text(
// "GS001",
// style: TextStyle(
// letterSpacing: 1.1,
// fontSize: 12,
// //color: Color(0XFFEBE2DB),
// color: Color(0XFFCFC4BB),
// fontWeight: FontWeight.bold),
// )
// ],
// ),
// ),
// ],
// ),
// Container(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// SizedBox(
// height: 5,
// ),
// util(username),
// util("$month 2021")
// ],
// ),
// )
// ],
// )

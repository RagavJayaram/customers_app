import '../Screens/ProfilePage.dart';
import '../Screens/addressChange/address_change_policy_list.dart';
import '../Screens/bankChange/bank_change_policy_list.dart';
import '../Screens/topup/topup_list_screen.dart';
import '../Screens/frequencyChange/frequency_change_policy_list.dart';
import '../Screens/policy_list.dart';
import 'package:flutter/material.dart';
import '../Screens/service_request_list.dart';
import '../Screens/login_screen.dart';
import '../Screens/reportGeneration/report_generation_policy_list.dart';
import '../Screens/policyList/monthly_policy_list.dart';

import 'package:flutter/material.dart';
import 'package:insuranceproject2/Screens/prem_calender.dart';
import 'package:slide_drawer/slide_drawer.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

enum SlideDrawerExampleType {
  BASIC,
  BACKGROUND,
  GRADIENT,
  HEAD_DRAWER,
  CONTENT_DRAWER,
  HEAD_CONTENT_DRAWER,
  FULL_DRAWER,
}

class _AppState extends State<App> {
  Key _appKey = UniqueKey();
  SlideDrawerExampleType type = SlideDrawerExampleType.BASIC;

  bool get _isBasic => type == SlideDrawerExampleType.BASIC;
  bool get _isBackground => type == SlideDrawerExampleType.BACKGROUND;
  bool get _isGradient => type == SlideDrawerExampleType.GRADIENT;
  bool get _isHead => type == SlideDrawerExampleType.HEAD_DRAWER;
  bool get _isContent => type == SlideDrawerExampleType.CONTENT_DRAWER;
  bool get _isHeadContent => type == SlideDrawerExampleType.HEAD_CONTENT_DRAWER;
  bool get _isFullDrawer => type == SlideDrawerExampleType.FULL_DRAWER;
  Widget createField(Icon icon, String text, int choice, BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          if (choice == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BankChangePolicyList(
                      choice: choice,
                    )));
          } else if (choice == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddressChangePolicyList(
                      choice: choice,
                    )));
          } else if (choice == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FrequencyChangePolicyList(
                      choice: 1,
                    )));
          } else if (choice == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportGenerationPolicyList(
                      choice: 3,
                    )));
          } else if (choice == 6 ||
              choice == 7 ||
              choice == 4 ||
              choice == -1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TopupListScreen(
                      choice: choice,
                    )));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MonthlyPolicyList(
                      choice: choice,
                    )));
          }
        });
  }
  List<MenuItem> get _items => [





    MenuItem('Policy List',
      icon: Icons.policy_outlined,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopupListScreen(

                ))); },),
    MenuItem('Service Request',
        icon: Icons.miscellaneous_services,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ServiceRequestList()));
        }),
    MenuItem('Address Change',
      icon: Icons.location_city,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddressChangePolicyList()));
      },),
    MenuItem('Frequency Change',
      icon: Icons.find_replace_sharp,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FrequencyChangePolicyList(

                )));
      },),
    MenuItem('Bank Change',
      icon: Icons.food_bank_rounded,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BankChangePolicyList(

                )));},),
    MenuItem('Surrender Quote',
      icon: Icons.subdirectory_arrow_right_rounded,
      onTap: () {

      },),
    MenuItem('Report Generation',
      icon: Icons.report,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReportGenerationPolicyList(

                )));    },),
    MenuItem('Top-up',
      icon: Icons.vertical_align_top,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopupListScreen(

                ))); },),
    MenuItem('Premium Redirection',
      icon: Icons.present_to_all,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopupListScreen(

                ))); },),
    MenuItem('Logout from this device',
      icon: Icons.logout,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginIn()));
      },
    )];
  List<MenuItem> get _itemsIcon => [
    MenuItem('Basic',
        icon: Icons.rss_feed,
        onTap: () => _changeType(SlideDrawerExampleType.BASIC)),
    MenuItem('Custom Background',
        icon: Icons.favorite_border,
        onTap: () => _changeType(SlideDrawerExampleType.BACKGROUND)),
    MenuItem('Custom Gradient',
        icon: Icons.mail_outline,
        onTap: () => _changeType(SlideDrawerExampleType.GRADIENT)),
    MenuItem('Custom Header',
        icon: Icons.map,
        onTap: () => _changeType(SlideDrawerExampleType.HEAD_DRAWER)),
    MenuItem('Custom Content',
        icon: Icons.person_outline,
        onTap: () => _changeType(SlideDrawerExampleType.CONTENT_DRAWER)),
    MenuItem('Header and Content',
        icon: Icons.alarm,
        onTap: () =>
            _changeType(SlideDrawerExampleType.HEAD_CONTENT_DRAWER)),
    MenuItem('Full Drawer',
        icon: Icons.settings,
        onTap: () => _changeType(SlideDrawerExampleType.FULL_DRAWER)),
  ];

  _changeType(type) {
    if (this.type != type)
      setState(() {
        this.type = type;
        _appKey = UniqueKey();
      });
  }

  Widget get _home {
    if (_isBasic) return _basic;
    if (_isBackground) return _background;
    if (_isGradient) return _gradient;
    if (_isHead) return _head;
    if (_isContent) return _content;
    if (_isHeadContent) return _headContent;
    if (_isFullDrawer) return _fullDrawer;
    return _basic;
  }

  Widget get _basic => SlideDrawer(
    child: HomePage(),
    items: _items,
  );

  Widget get _background => SlideDrawer(
    child: PremCalender(),
    brightness: Brightness.dark,
    backgroundColor: Colors.blue[900],
    items: _items,
  );

  Widget get _gradient => SlideDrawer(
    child: PremCalender(),
    brightness: Brightness.dark,
    backgroundGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      colors: [
        Color(0xFF000046),
        Color(0xFF1CB5E0),
      ],
    ),
    curve: Curves.easeInOut,
    items: _itemsIcon,
  );

  Widget get _head => SlideDrawer(
    child: PremCalender(),
    brightness: Brightness.dark,
    backgroundColor: Colors.blue[800],
    headDrawer: Image.asset('boys.png'),
    alignment: SlideDrawerAlignment.start,
    items: _itemsIcon,
  );

  Widget get _content => SlideDrawer(
    child: PremCalender(),
    brightness: Brightness.dark,
    contentDrawer: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          for (var item in _itemsIcon)
            ListTile(
              title: Text(item.title),
              leading: Icon(item.icon),
              onTap: item.onTap,
            ),
        ],
      ),
    ),
    backgroundGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      colors: [
        Colors.blue[800],
        Color(0xFF1CB5E0),
      ],
    ),
  );

  Widget get _headContent => SlideDrawer(
    child: PremCalender(),
    brightness: Brightness.light,
    backgroundColor: Color(0xffededed),
    alignment: SlideDrawerAlignment.start,
    headDrawer: Image.asset('boys.png'),
    contentDrawer: Container(
      padding: EdgeInsets.only(left: 10, top: 18),
      child: Column(
        children: [
          for (var item in _itemsIcon)
            ListTile(
              title: Text(item.title),
              leading: Icon(item.icon),
              onTap: item.onTap,
            ),
        ],
      ),
    ),
  );

  Widget get _fullDrawer => SlideDrawer(
    child: PremCalender(),
    isRotate: false,
    offsetFromRight: 100,
    drawer: Container(
      color: Colors.teal,
      padding: EdgeInsets.symmetric(vertical: 36, horizontal: 15),
      child: Theme(
        data: ThemeData(brightness: Brightness.dark),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var item in _items)
              ListTile(
                title: Text(item.title),
                onTap: item.onTap,
              ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      key: _appKey,
      title: 'Slide Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _home,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Premium Due',style: TextStyle(fontSize: 25),),
          centerTitle: true,
          backgroundColor: Colors.purple[900],
          leading: IconButton(
            icon: Icon(Icons.menu),
            // call toggle from SlideDrawer to alternate between open and close
            // when pressed menu button
            onPressed: () => SlideDrawer.of(context)?.toggle(),
          ),
        ),
        body: PremCalender()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../model/account_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountHistory extends StatefulWidget {
  @override
  _AccountHistoryState createState() => _AccountHistoryState();
}

class _AccountHistoryState extends State<AccountHistory>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  final List<AccountHistoryModel> _stubItems = [
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:34"),
    AccountHistoryModel(title: "Secured Plot", date: "May 02 2021 02:00:24"),
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:39"),
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:34"),
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:36"),
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:14"),
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:34"),
    AccountHistoryModel(
        title: "Submitted Account Form", date: "May 02 2021 02:00:34"),
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/kalifa_gardens.svg'),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Image.asset(
                'assets/images/app_icon.png',
                width: 40.0,
                height: 40.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              if (_drawerscaffoldkey.currentState!.isEndDrawerOpen) {
                _animationController!.reverse();
                Navigator.pop(context);
              } else {
                _drawerscaffoldkey.currentState!.openEndDrawer();
                _animationController!.forward();
              }
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController!,
            ),
          ),
        ],
      ),
      body: Scaffold(
        key: _drawerscaffoldkey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomDrawer(),
        ),
        body: Container(
          color: Color(0xFFD5E1E1),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                color: Color(0xFFD4B581),
                child: Center(
                  child: Text(
                    'Account History',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                children: [
                  for (var k = 0; k < _stubItems.length; k++)
                    ListTile(
                      title: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _stubItems[k].title!,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Text(
                              _stubItems[k].date!,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        print('You clicked on item $k');
                      },
                    ),
                  SizedBox(
                    height: 8.0,
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

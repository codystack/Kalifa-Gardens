import 'dart:convert';

import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../components/news_update_item.dart';
import '../model/news_updates_model.dart';
import '../screens/news_update_detail.dart';
import '../util/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsAndUpdates extends StatefulWidget {
  @override
  _NewsAndUpdatesState createState() => _NewsAndUpdatesState();
}

class _NewsAndUpdatesState extends State<NewsAndUpdates>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

//  int _currentPage = 0;
//  PageController _pageController =  PageController(initialPage: 0);

  Future<void> _getNewsUpdates() async {
    final response = await APIService().getNewsItems();

    print('NEWS RESP ${jsonDecode(response.body)}');
    print('RESPONSE ${jsonDecode(response.body)}');

    if (response.statusCode == 200) {
      //All good

    }
  }

  @override
  void initState() {
    super.initState();
    _getNewsUpdates();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  final List fakeNews = [
    NewsUpdateModel(
      title: "Dredging Phase Concluded",
      image: "assets/images/stub_image_1.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet in sit posuere libero amet, quis. Risus integer malesuada amet enim aliquam malesuada. Adipiscing arcu donec lacus imperdiet. Phasellus aliquam ac posuere congue. Auctor rhoncus sed dui, non. Diam ornare sed auctor enim. .",
    ),
    NewsUpdateModel(
      title: "5000sqm Now Selling",
      image: "assets/images/stub_image_1.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Containing all the necessary utilities for basic essentials and convenience; hotel, mosque, hospital, police and fire stations, modern shopping mall, office complex, church, fuel station, bank.",
    ),
  ];

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
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                color: Color(0xFFD4B581),
                child: Center(
                  child: Text(
                    'News and Updates',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
//            ListView.builder(
//              itemCount: fakeNews.length,
//              itemBuilder: (context, index) {
//                return ListTile(
//                  onTap: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsUpdateDetail(newsItem: fakeNews[index])));
//                  },
//                  title: NewsUpdateItem(newsUpdateModel: fakeNews[index]),
//                );
//              },
//            ),
              Column(
                children: <Widget>[
                  for (var a = 0; a < fakeNews.length; a++)
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewsUpdateDetail(newsItem: fakeNews[a])));
                      },
                      title: NewsUpdateItem(newsUpdateModel: fakeNews[a]),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

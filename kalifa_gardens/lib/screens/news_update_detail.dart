import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../model/news_updates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsUpdateDetail extends StatefulWidget {
  const NewsUpdateDetail({Key? key, @required this.newsItem}) : super(key: key);

  final NewsUpdateModel? newsItem;

  @override
  _NewsUpdateDetailState createState() => _NewsUpdateDetailState();
}

class _NewsUpdateDetailState extends State<NewsUpdateDetail>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

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
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 2.0,
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Image.asset(widget.newsItem!.image!),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 21.0, left: 21.0, right: 21.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Project Update'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFD8D8D8),
                                padding: const EdgeInsets.all(6.0),
                                onPrimary: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Share',
                                style: TextStyle(
                                    color: Color(0xFFD4B581),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          widget.newsItem!.title!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.newsItem!.description!,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Image.asset(widget.newsItem!.image!)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

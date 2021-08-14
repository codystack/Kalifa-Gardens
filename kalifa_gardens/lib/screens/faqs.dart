import 'dart:convert';

import '../components/custom_drawer.dart';
import '../components/shimmer_loading.dart';
import '../model/faqs_model.dart';
import '../model/faqs_response.dart';
import '../util/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

List<FAQsModel> generateFAQsList(int num) {
  return List.generate(num, (index) {
    return FAQsModel(
        title: 'How do I secure my plot?',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Enim in rutrum eget accumsan lobortis adipiscing diam et. Hendrerit pretium vel id et nibh turpis est lorem. Amet in quam nec, feugiat tempus, adipiscing neque interdum. Cras tortor molestie ligula vulputate nisi nisl velit turpis. Ultricies volutpat velit. '
            '\n\nItem at position $index');
  });
}

class _FAQsState extends State<FAQs> with TickerProviderStateMixin {
  AnimationController? _animationController;
  bool _isLoading = true;

  Future<List<FAQsResponse>> fetchFAQs(http.Client client) async {
    final response =
        await client.get(Uri.parse('https://api.kalifagardens.net/faqs'));

    print('RESPONSE ${jsonDecode(response.body)}');

    if (response.statusCode == 200) {
      print('SUCCESS');
      setState(() {
        _isLoading = false;
      });
      print('LOADED');
    }
    // Use the compute function to run parsePhotos in a separate isolate.
    return parseFAQs(response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<FAQsResponse> parseFAQs(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<FAQsResponse>((json) => FAQsResponse.fromJson(json))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  List<FAQsModel> _faqsData = generateFAQsList(5);

  Widget _buildShimmer() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: Column(children: [
        for (var i = 0; i < 8; i++)
          Container(
            width: double.infinity,
            height: 48.0,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
      ]),
    );
  }

  Widget _buildExpansionTile(List<FAQsResponse> _faqsRespList) {
    return Column(
      children: _faqsRespList.map<Card>(
        (FAQsResponse model) {
          return Card(
            margin: const EdgeInsets.all(2.0),
            elevation: 2.0,
            child: ExpansionTile(
              title: Text(
                model.question!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.grey[200],
                  child: Text(model.answer!),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
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
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Color(0xFFD4B581),
              child: Center(
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 21.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: FutureBuilder<List<FAQsResponse>>(
                future: fetchFAQs(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'An error has occurred!',
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return _buildExpansionTile(snapshot.data!);
                  } else {
                    return _buildShimmer();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

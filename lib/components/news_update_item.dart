import '../model/news_updates_model.dart';
import 'package:flutter/material.dart';

class NewsUpdateItem extends StatelessWidget {
//  final String title, desc;
//  final List slideItems;
  final NewsUpdateModel? newsUpdateModel;
  NewsUpdateItem({this.newsUpdateModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.asset(newsUpdateModel!.image!),
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
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Project Update'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD8D8D8),
                    padding: const EdgeInsets.all(6.0),
                    onPrimary: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  newsUpdateModel!.title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  newsUpdateModel!.description!,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

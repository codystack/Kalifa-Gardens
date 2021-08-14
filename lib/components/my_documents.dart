import '../model/my_documents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDocuments extends StatefulWidget {
  @override
  _MyDocumentsState createState() => _MyDocumentsState();
}

class _MyDocumentsState extends State<MyDocuments> {
  List<MyDocumentsModel> fakeDocuments = [
    MyDocumentsModel(
        title: "Offer Letter",
        image: "assets/images/document_thumbnail.svg",
        url: ""),
    MyDocumentsModel(
        title: "Payment Schedule",
        image: "assets/images/document_thumbnail.svg",
        url: ""),
    MyDocumentsModel(
        title: "Survey Document",
        image: "assets/images/document_thumbnail.svg",
        url: ""),
    MyDocumentsModel(
        title: "Letter of Allocation",
        image: "assets/images/document_thumbnail.svg",
        url: ""),
  ];

  Widget _listItem(int index) {
    return ListTile(
      onTap: () {},
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Color(0x41FFFFFF),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Color(0xA3ABCFC2),
                  child: SvgPicture.asset(fakeDocuments[index].image!),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    fakeDocuments[index].title!,
                    style: TextStyle(
                        color: Color(0xFF0A4D50),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'View Document',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                elevation: 0.0,
                padding: const EdgeInsets.all(4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) => _listItem(i),
      scrollDirection: Axis.vertical,
      itemCount: fakeDocuments.length,
    );
  }
}

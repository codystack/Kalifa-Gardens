import '../model/proof_of_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProofOfPayment extends StatefulWidget {
  @override
  _ProofOfPaymentState createState() => _ProofOfPaymentState();
}

class _ProofOfPaymentState extends State<ProofOfPayment> {
  List<ProofOfPaymentModel> fakeProofs = [
    ProofOfPaymentModel(
        title: "Schedule 1",
        thumbnail: "assets/images/document_thumbnail.svg",
        isDone: true),
    ProofOfPaymentModel(
        title: "Schedule 2",
        thumbnail: "assets/images/document_thumbnail.svg",
        isDone: false),
    ProofOfPaymentModel(
        title: "Schedule 3",
        thumbnail: "assets/images/document_thumbnail.svg",
        isDone: false),
    ProofOfPaymentModel(
        title: "Schedule 4",
        thumbnail: "assets/images/document_thumbnail.svg",
        isDone: false),
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
                  child: SvgPicture.asset(fakeProofs[index].thumbnail!),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    fakeProofs[index].title!,
                    style: TextStyle(
                        // color: Color(0xFF0A4D50),
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
            color: fakeProofs[index].isDone!
                ? Color(0xFF6DA544)
                : Color(0xFF9D9D9D),
            padding: const EdgeInsets.all(0.0),
            child: ElevatedButton.icon(
              onPressed: fakeProofs[index].isDone! ? () {} : null,
              icon: Icon(Icons.upload_file),
              label: Text(
                'Upload Document',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                primary: fakeProofs[index].isDone!
                    ? Color(0xFF6DA544)
                    : Colors.transparent,
                onPrimary:
                    fakeProofs[index].isDone! ? Colors.white : Colors.white70,
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
      itemCount: fakeProofs.length,
    );
  }
}

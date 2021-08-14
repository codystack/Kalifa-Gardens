import '../controller/state_controller.dart';
import '../screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ContractOfSales extends StatelessWidget {
  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          color: Color(0x4DB2B2B2),
          child: SvgPicture.asset('assets/images/contract_of_sales.svg'),
        ),
        SizedBox(
          height: 16.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'A contract of sale will be sent shortly',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF0A4D50),
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Our sales representatives will reach out to you to guide the next steps.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF0A4D50), fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Upon the receipt of the contract of sale; you will be required to send back a signed copy to the address below:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'Orange Island Projects Office, 22, Dr. Omon Ebhomenye Street, off Awudu Ekpegha Street, Lekki Phase One, Lagos, Nigeria',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: 21,
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _controller.resetAll();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
            child: Text(
              'Complete',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ),
      ],
    );
  }
}

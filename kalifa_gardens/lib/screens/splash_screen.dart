//import 'package:demo_app/controller/state_controller.dart';
//import 'package:demo_app/screens/onboarding.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:get/get.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//import 'dashboard.dart';
//
//class SplashScreen extends StatefulWidget {
//
//  @override
//  _SplashScreenState createState() => _SplashScreenState();
//}
//
//class _SplashScreenState extends State<SplashScreen> {
//
//  bool _isLoggedIn = false;
//  final _controller = Get.put(StateController());
//
//  _loadController() async {
//    final prefs = await SharedPreferences.getInstance();
//    _isLoggedIn = prefs.getBool('loggedIn') ?? false;
//  }
//
//  @override
//  void initState() {
//    _loadController();
//
//    // TODO: implement initState
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    Future.delayed(Duration(seconds: 5), () {
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _isLoggedIn ? Dashboard() : Onboarding()));
//    });
//
//    return Scaffold(
//      backgroundColor: Color(0xFF0A4D50),
//      appBar: null,
//      body: Container(
//        width: double.infinity,
//        height: double.infinity,
//        color: Color(0xFF0A4D50),
//        child: Stack(
//          children: [
//            Center(
//              child: SvgPicture.asset('assets/images/splash_image.svg'),
//            ),
//            Container(
//              width: double.infinity,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: [
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.33,
//                    height: MediaQuery.of(context).size.height * 0.16,
//                    child: CustomPaint(
//                      foregroundPainter: LinePainter(),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Container(
//              width: double.infinity,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: [
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.52,
//                    height: MediaQuery.of(context).size.height * 0.25,
//                    child: CustomPaint(
//                      foregroundPainter: LinePainter2(),
//                    ),
//                  ),
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class LinePainter extends CustomPainter {
//
//  @override
//  void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Color(0xFFD4B581)
//       ..strokeCap = StrokeCap.square
//       ..strokeWidth = 10;
//
//     canvas.drawLine(
//       Offset(-5, size.height),
//       Offset(size.width, size.height * 0),
//       paint
//     );
//
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) => false;
//}
//
//class LinePainter2 extends CustomPainter {
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    final paint = Paint()
//      ..color = Color(0xFFD4B581)
//      ..strokeCap = StrokeCap.square
//      ..strokeWidth = 48;
//
//    canvas.drawLine(
//        Offset(-5, size.height),
//        Offset(size.width, size.height * 0),
//        paint
//    );
//
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) => false;
//}
//

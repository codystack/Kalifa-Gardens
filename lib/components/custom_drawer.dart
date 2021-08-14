import '../forms/contact_us.dart';
import '../screens/account_history.dart';
import '../screens/buyer_benefits.dart';
import '../screens/faqs.dart';
import '../screens/manage_documents.dart';
import '../screens/news_and_update.dart';
import '../screens/project_profile.dart';
import '../screens/purchase_plot.dart';
import '../screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  _showContactUs(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 420,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        color: Color(0xFFE8E8E8),
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'CONTACT US',
                            style: TextStyle(
                              color: Color(0xFF0A4D50),
                              fontWeight: FontWeight.w600,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            ContactUs(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
//                                                  _dialogKey.currentState.
                      },
                      icon: Icon(Icons.close),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        color: Colors.white),
                  ),
                  top: -60,
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0A4D50),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PurchasePlot()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Purchase Plot',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/purchase_plot2.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyerBenefits()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Buyer Benefits',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/buyer_benefits2.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountHistory()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Account History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/account_history2.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectProfile()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Project Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/project_profile2.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageDocuments()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Manage Documents',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/manage_documents2.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsAndUpdates()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'News and Updates',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/news_and_updates.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQs()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/faqs.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/settings.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () => _showContactUs(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/contact_us.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 0.0),
                  )),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Developer’s Other Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset(
                        'assets/images/developers_other_projects.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF032425),
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 2.0),
                    left: BorderSide(color: Colors.white, width: 2.0),
                    right: BorderSide(color: Colors.white, width: 2.0),
                    bottom: BorderSide(color: Colors.white, width: 2.0),
                  )),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/images/logout.svg')
                  ],
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(21.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:demo_app/forms/contact_us.dart';
import 'package:demo_app/forms/corporate_registration_form.dart';
import 'package:demo_app/forms/individual_registration_form.dart';
import 'package:demo_app/screens/Login.dart';
import 'package:demo_app/screens/account_type_registration.dart';
import 'package:demo_app/screens/buyer_benefits.dart';
import 'package:demo_app/screens/faqs.dart';
import 'package:demo_app/screens/project_profile.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExpandableSection extends StatelessWidget {

  final _dialogKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableNotifier(
          child: Container(
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        )),
//                    collapsed: Text(
//                      '',
//                      softWrap: true,
//                      maxLines: 2,
//                      overflow: TextOverflow.ellipsis,
//                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A4D50),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountTypeRegistration()
                                ),
                              )
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Create Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A4D50),
                          ),
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 0, right: 0, bottom: 5),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        ExpandableNotifier(
          child: Container(
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Explore",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
//                    collapsed: Text(
//                      '',
//                      softWrap: true,
//                      maxLines: 2,
//                      overflow: TextOverflow.ellipsis,
//                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProjectProfile()
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Project Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A4D50),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuyerBenefits()
                                ),
                              )
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Buyer Benefits',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A4D50),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FAQs()
                                ),
                              )
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'FAQs',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A4D50),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () => {
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
                                                      ContactUs()
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
                                                  color: Colors.white
                                              ),
                                            ),
                                            top: -60,
                                          )
                                        ],
                                      ),
                                    );
                                  })
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Contact Us',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0A4D50),
                          ),
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 0, right: 0, bottom: 5),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
///// Flutter code sample for SingleChildScrollView
//
//// In this example, the column becomes either as big as viewport, or as big as
//// the contents, whichever is biggest.
//
//import 'package:flutter/material.dart';
//
///// This is the stateless widget that the main application instantiates.
//class OnboardingContent extends StatelessWidget {
//  const OnboardingContent({Key? key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTextStyle(
//      style: Theme.of(context).textTheme.bodyText2!,
//      child: LayoutBuilder(
//        builder: (BuildContext context, BoxConstraints viewportConstraints) {
//          return SingleChildScrollView(
//            child: ConstrainedBox(
//              constraints: BoxConstraints(
//                minHeight: viewportConstraints.maxHeight,
//              ),
//              child: IntrinsicHeight(
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      // A fixed-height child.
//                      color: const Color(0xffeeee00), // Yellow
//                      height: 120.0,
//                      alignment: Alignment.center,
//                      child: const Text('Fixed Height Content'),
//                    ),
//                    Expanded(
//                      // A flexible child that will grow to fit the viewport but
//                      // still be at least as big as necessary to fit its contents.
//                      child: Container(
//                        color: const Color(0xffee0000), // Red
//                        height: 120.0,
//                        alignment: Alignment.center,
//                        child: const Text('Flexible Content'),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}

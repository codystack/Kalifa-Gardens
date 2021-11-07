import 'package:flutter/material.dart';

Future showTermsOfService(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 430,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      color: Color(0xFFE8E8E8),
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'To proceed, you have to agree to Kalifa Gardens terms and conditions',
                          style: TextStyle(
                            color: Color(0xFF0A4D50),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Card(
                        elevation: 2.0,
                        margin: const EdgeInsets.all(0.0),
                        child: Scrollbar(
                          isAlwaysShown: true,
                          thickness: 10.0,
                          child: ListView(
                            padding: const EdgeInsets.all(10.0),
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'Terms of Service',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Placerat mollis eget vulputate nunc, nec consequat risus sit id. Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra. '
                                  'consequat risus sit id. Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra.'
                                  'consequat risus sit id. Egestas eget laoreet molestie m. d Lacus turpis et tristique vulputate sit pharetra.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'I Agree',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(8.0),
                        ),
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

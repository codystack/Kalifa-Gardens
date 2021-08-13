import 'dart:ui';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {

  bool _isAllowPushNotifications = true, _isDocRequestEmail = false, _isDocRequestApp = false, _isNewLoginAttemptEmail = true, _isNewLoginAttemptApp = false;
  bool _isMilestoneApp = true, _isMilestoneEmail = false, _isPaymentRemindEmail = true, _isPaymentRemindApp = false, _isNewsUpdatesApp = true, _isNewsUpdatesEmail = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Color(0xFFC4C4C4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Allow Push Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18, fontWeight: FontWeight.w700,
                ),
              ),
              Checkbox(
                value: _isAllowPushNotifications,
                checkColor: Colors.white,
                activeColor: Color(0xFF0A4D50),
                onChanged: (state) {
                  setState(() {
                    _isAllowPushNotifications = state;
                  });
                },
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(width: 0.0,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('EMAIL', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black, fontFamily: 'Mulish'), ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('APP', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black, fontFamily: 'Mulish'),),
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Document Update Request',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black, fontFamily: 'Mulish'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Checkbox(
                      value: _isDocRequestEmail,
                      checkColor: Colors.white,
                      activeColor: Color(0xFF0A4D50),
                      onChanged: (state) {
                        setState(() {
                          _isDocRequestEmail = state;
                        });
                      },
                    )
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isDocRequestApp,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isDocRequestApp = state;
                          });
                        },
                      )
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'New Login Attempt',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black, fontFamily: 'Mulish'),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isNewLoginAttemptEmail,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isNewLoginAttemptEmail = state;
                          });
                        },
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isNewLoginAttemptApp,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isNewLoginAttemptApp = state;
                          });
                        },
                      )
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Milestone Achievement',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black, fontFamily: 'Mulish'),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isMilestoneEmail,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isMilestoneEmail = state;
                          });
                        },
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isMilestoneApp,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isMilestoneApp = state;
                          });
                        },
                      )
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Payment Reminder',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black, fontFamily: 'Mulish'),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isPaymentRemindEmail,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isPaymentRemindEmail = state;
                          });
                        },
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isPaymentRemindApp,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isPaymentRemindApp = state;
                          });
                        },
                      )
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'News and Updates',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black, fontFamily: 'Mulish'),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isNewsUpdatesEmail,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isNewsUpdatesEmail = state;
                          });
                        },
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Checkbox(
                        value: _isNewsUpdatesApp,
                        checkColor: Colors.white,
                        activeColor: Color(0xFF0A4D50),
                        onChanged: (state) {
                          setState(() {
                            _isNewsUpdatesApp = state;
                          });
                        },
                      )
                  )
                ],
              ),
              SizedBox(height: 21.0,),
            ],
          ),
        ),
        SizedBox(height: 21,),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            padding: const EdgeInsets.all(16.0)
          ),
        )
      ],
    );
  }
}

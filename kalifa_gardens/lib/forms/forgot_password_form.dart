import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                    hintText: 'Email address',
                    prefixIcon: Icon(Icons.email),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
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
                    'Send Instruction',
                    style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(18.0)
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

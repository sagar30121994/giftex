import 'package:flutter/material.dart';
import 'package:giftex/screens/signup/login.dart';

class PopupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sign up / Sign in'),
      content: Text('You need to sign up or sign in first.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Loginpage()));
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}

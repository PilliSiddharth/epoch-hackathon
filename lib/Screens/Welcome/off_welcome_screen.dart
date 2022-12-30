import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'welcome_screen.dart';
import 'title_and_message.dart';

class OffWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          Image.asset('assets/images/welcome_image.png',
              width: double.infinity, height: deviceHeight * 0.4),
          SizedBox(
            height: deviceHeight * 0.05,
          ),
          TitleAndMessage(deviceHeight),
          SizedBox(
            height: deviceHeight * 0.03,
          ),
          const SizedBox(
            height: 30,
            width: 50,
          ),
          CupertinoButton(
              child: const Text('Start Using!'),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ));
              }),
        ]),
      ),
    );
  }
}

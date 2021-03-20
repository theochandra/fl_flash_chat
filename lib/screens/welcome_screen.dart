import 'package:fl_flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {

  static const routeName = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() { });
    });

    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.decelerate,
    // );

    // animation.addStatusListener((status) {
    //   // status completed will be given if use forward
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   }
    //   // status dismissed will be given if use reverse
    //   else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
  }

  @override
  void dispose() {
    // if we don't dispose animation controller it will still live
    // in application and use phone resources
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                // Go to Login screen.
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
              //Go to registration screen.
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

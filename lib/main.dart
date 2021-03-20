import 'package:fl_flash_chat/screens/chat_screen.dart';
import 'package:fl_flash_chat/screens/login_screen.dart';
import 'package:fl_flash_chat/screens/registration_screen.dart';

import 'package:fl_flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     subtitle1: TextStyle(color: Colors.black54),
      //     bodyText2: TextStyle(color: Colors.black54),
      //   ),
      //   inputDecorationTheme: InputDecorationTheme(
      //     hintStyle: TextStyle(
      //       color: Colors.black54,
      //     ),
      //   ),
      // ),
      initialRoute: WelcomeScreen.routeName,
      // routes receive input map
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
    );
  }
}

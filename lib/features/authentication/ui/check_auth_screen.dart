import 'package:flutter/material.dart';

import 'package:musickeando/features/authentication/authentication.dart';
import 'package:musickeando/features/screens.dart';
import 'widgets/waiting_screen.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Authentication().authentication(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const WaitingScreen();
        } else {
          print('Snapshot CheckAuth: ${snapshot.data}');
          if (snapshot.data != 'success') {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const AuthenticationScreen(),
                      transitionDuration: const Duration(seconds: 0)));
            });
          } else {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0)));
            });
          }
          return const WaitingScreen();
        }
      },
    );
  }
}

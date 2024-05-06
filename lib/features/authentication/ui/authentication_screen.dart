import 'package:flutter/material.dart';
import 'package:musickeando/features/widgets.dart';

import 'widgets/auth_header.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: Stack(
      children: [
        const Background(),
        HeaderAuth(mediaQuery: mediaQuery),
      ],
    ));
  }
}

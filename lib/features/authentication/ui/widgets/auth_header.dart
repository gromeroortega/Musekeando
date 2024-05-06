import 'package:flutter/material.dart';

import 'auth_button.dart';
import 'package:musickeando/features/authentication/authentication.dart';
import 'package:musickeando/features/app/ui/theme/app_theme.dart';
import 'package:musickeando/features/notifications/notifications.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: mediaQuery.size.height / 3.5,
      child: Column(children: [
        Icon(Icons.headphones, size: 50, color: context.colors.primary),
        const SizedBox(height: 25),
        Text('Bienvenido a Musickeando', style: context.titleLarge),
        const SizedBox(height: 100),
        GestureDetector(
            child: const AuthButton(),
            onTap: () => Authentication().authentication().then((res) {
                  if (res == 'success') {
                    Navigator.pushReplacementNamed(context, '/home',
                        arguments: res);
                  } else {
                    AppNotification.errorAlert(res);
                  }
                }))
      ]),
    );
  }
}

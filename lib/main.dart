import 'package:flutter/material.dart';

import 'features/app/app_state.dart';
import 'features/app/ui/routes/app_routes.dart';
import 'features/app/ui/theme/app_theme.dart';
import 'features/notifications/notifications.dart';

void main() => runApp(const AppState());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musickeando',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: (_) => AppRoutes.onGenerateRoute(_),
      theme: AppTheme().dark,
      scaffoldMessengerKey: AppNotification.messegerKey,
    );
  }
}

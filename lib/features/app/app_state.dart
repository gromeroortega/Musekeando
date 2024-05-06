import 'package:flutter/material.dart';
import 'package:musickeando/features/app/provider/providers.dart';

import 'package:musickeando/features/services.dart';
import 'package:musickeando/main.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Services
        ChangeNotifierProvider(create: (_) => PlayListService()),
        ChangeNotifierProvider(create: (_) => ArtistsServices()),
        ChangeNotifierProvider(create: (_) => SearchService()),
        //Providers
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: const MyApp(),
    );
  }
}

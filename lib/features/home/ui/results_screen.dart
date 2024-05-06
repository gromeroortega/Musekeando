import 'package:flutter/material.dart';
import 'package:musickeando/features/data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final results = ModalRoute.of(context)!.settings.arguments as Search;
    return Scaffold(
      body: Center(
        child: Text(results.albums.items[0].name),
      ),
    );
  }
}

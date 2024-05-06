import 'package:flutter/material.dart';

import 'package:musickeando/features/services.dart';

import '../../data.dart';
import 'widgets/widgets.dart';

class DataSearch extends SearchDelegate {
  final searchService = SearchService();
  String selecction = '';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.indigoAccent,
        child: Text(selecction),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      future: searchService.searchAll(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('No hay resultados para mostrar'));
        } else {
          final results = snapshot.data as Search;
          return Column(
            children: [ArtistList(artis: results.artists.items)],
          );
        }
      },
    );
  }
}

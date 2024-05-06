import 'package:flutter/material.dart';
import 'package:musickeando/features/data.dart';
import 'package:musickeando/features/services.dart';
import 'package:provider/provider.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({
    Key? key,
    required this.artis,
  }) : super(key: key);

  final List<ArtistsItem> artis;

  @override
  Widget build(BuildContext context) {
    final topArtists = Provider.of<ArtistsServices>(context);
    return Container(
      margin: const EdgeInsets.only(top: 125),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.all(5.0),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          //final artist = artists[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: NetworkImage(
                    'https://crazyminds.es/wp-content/uploads/SYSTEM-OF-A-DOWN-2020.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}

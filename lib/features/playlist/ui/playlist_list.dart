import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:musickeando/features/data.dart';
import 'package:musickeando/features/services.dart';
import 'package:musickeando/features/app/ui/theme/app_theme.dart';

class PlaylistList extends StatelessWidget {
  const PlaylistList({Key? key, required this.mediaquery}) : super(key: key);

  final MediaQueryData mediaquery;

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<PlayListService>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: FutureBuilder(
          future: service.getFeaturedPlaylists(),
          builder: (BuildContext context,
              AsyncSnapshot<List<OnePlayList>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final lists = snapshot.data as List<OnePlayList>;
              return SizedBox(
                height: 200,
                child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    scrollDirection: Axis.horizontal,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final list = lists[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 160,
                          height: 160,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(list.images[0].url!))),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}

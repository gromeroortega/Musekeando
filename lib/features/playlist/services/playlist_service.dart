import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';

import 'package:musickeando/features/authentication/authentication.dart';
import 'package:musickeando/features/data.dart';

class PlayListService extends ChangeNotifier {
  final auth = Authentication();

  Future<List<OnePlayList>> getFeaturedPlaylists() async {
    //get access with authtoken
    final instanceSpotify = SpotifyApi.withAccessToken(auth.access!);
    //return variable instance
    final List<OnePlayList> playLists = [];
    //get user info
    try {
      final user = await instanceSpotify.me.get();
      final userPlayList =
          instanceSpotify.playlists.getUsersPlaylists(user.id!);
      final allPlayList = await userPlayList.all();
      //response iteration
      for (var item in allPlayList) {
        final playList = OnePlayList(
            collaborative: item.collaborative!,
            description: item.description!,
            externalUrls: item.externalUrls!.toString(),
            href: item.href!,
            id: item.id!,
            images: [
              PlayListImage(
                  height: item.images!.first.height,
                  width: item.images!.first.width,
                  url: item.images!.first.url)
            ],
            name: item.name!,
            public: item.public!,
            snapshotId: item.snapshotId!,
            tracks: InfoTracks(
                href: item.tracksLink!.href!, total: item.tracksLink!.total!),
            uri: item.uri!);
        //add playlist to return variable
        playLists.add(playList);
      }
      notifyListeners();
      return playLists;
    } catch (e) {
      print(e);

      return playLists;
    }
  }
}

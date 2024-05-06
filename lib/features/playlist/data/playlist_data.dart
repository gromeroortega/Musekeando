import 'dart:convert';

PlaylistData playlistDataFromJson(String str) =>
    PlaylistData.fromJson(json.decode(str));

class PlaylistData {
  PlaylistData({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  String href;
  List<OnePlayList> items;
  int limit;
  String next;
  int offset;
  dynamic previous;
  int total;

  factory PlaylistData.fromJson(Map<String, dynamic> json) => PlaylistData(
        href: json["href"],
        items: List<OnePlayList>.from(
            json["items"].map((x) => OnePlayList.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );
}

class OnePlayList {
  OnePlayList({
    required this.collaborative,
    this.description,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    this.owner,
    required this.public,
    required this.snapshotId,
    required this.tracks,
    required this.uri,
    this.itemType,
  });

  bool collaborative;
  String? description;
  String externalUrls;
  String href;
  String id;
  List<PlayListImage> images;
  String name;
  Owner? owner;
  bool public;
  String snapshotId;
  InfoTracks tracks;
  String? itemType;
  String uri;

  factory OnePlayList.fromJson(Map<String, dynamic> json) => OnePlayList(
        collaborative: json["collaborative"],
        description: json["description"] ?? '',
        externalUrls: json["external_urls"],
        href: json["href"],
        id: json["id"],
        images: List<PlayListImage>.from(
            json["images"].map((x) => PlayListImage.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: InfoTracks.fromJson(json["tracks"]),
        itemType: json["type"],
        uri: json["uri"],
      );
}

class PlayListImage {
  PlayListImage({
    this.height,
    this.url,
    this.width,
  });

  int? height;
  String? url;
  int? width;

  factory PlayListImage.fromJson(Map<String, dynamic> json) => PlayListImage(
        height: json["height"] ?? 0,
        url: json["url"] ?? '',
        width: json["width"] ?? 0,
      );
}

class Owner {
  Owner({
    required this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  String? displayName;
  String? externalUrls;
  String? href;
  String? id;
  String? type;
  Uri? uri;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: json["external_urls"],
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
      );
}

class InfoTracks {
  InfoTracks({
    required this.href,
    required this.total,
  });

  String? href;
  int? total;

  factory InfoTracks.fromJson(Map<String, dynamic> json) => InfoTracks(
        href: json["href"],
        total: json["total"],
      );
}

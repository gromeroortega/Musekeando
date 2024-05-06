import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

class Search {
  Search({
    required this.albums,
    required this.artists,
  });

  Albums albums;
  Artists artists;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        albums: Albums.fromJson(json["albums"]),
        artists: Artists.fromJson(json["artists"]),
      );
}

class Albums {
  Albums({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  String href;
  List<AlbumsItem> items;
  int limit;
  String next;
  int offset;
  String previous;
  int total;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json["href"],
        items: List<AlbumsItem>.from(
            json["items"].map((x) => AlbumsItem.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );
}

class AlbumsItem {
  AlbumsItem({
    required this.albumType,
    required this.artists,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  String albumType;
  List<Artist> artists;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<ImageSearch> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  int totalTracks;
  String type;
  String uri;

  factory AlbumsItem.fromJson(Map<String, dynamic> json) => AlbumsItem(
        albumType: json["album_type"],
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<ImageSearch>.from(
            json["images"].map((x) => ImageSearch.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );
}

class Artist {
  Artist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String type;
  String uri;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });

  String spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class ImageSearch {
  ImageSearch({
    required this.height,
    required this.url,
    required this.width,
  });

  int height;
  String url;
  int width;

  factory ImageSearch.fromJson(Map<String, dynamic> json) => ImageSearch(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );
}

class Artists {
  Artists({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  String href;
  List<ArtistsItem> items;
  int limit;
  String next;
  int offset;
  String previous;
  int total;

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        href: json["href"],
        items: List<ArtistsItem>.from(
            json["items"].map((x) => ArtistsItem.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );
}

class ArtistsItem {
  ArtistsItem({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });

  Map<String, dynamic> externalUrls;
  Followers followers;
  List<String> genres;
  String href;
  String id;
  List<ImageSearch> images;
  String name;
  int popularity;
  String type;
  String uri;

  factory ArtistsItem.fromJson(Map<String, dynamic> json) => ArtistsItem(
        externalUrls: json["external_urls"],
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<ImageSearch>.from(
            json["images"].map((x) => ImageSearch.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );
}

class Followers {
  Followers({
    this.href,
    required this.total,
  });

  String? href;
  int total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );
}

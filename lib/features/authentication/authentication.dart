import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:spotify/spotify.dart';

class Authentication {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Map<String, dynamic> keys = {
    "id": "087c7f6036a045a88b892ab1e3e75029",
    "secret": "f8a64c9b286f41cb9e5b3f7066b3fccd",
    "redirectUrl": "musickeando:/",
    "scope": [
      'playlist-modify-public',
      'playlist-read-private',
      'playlist-modify-private'
    ]
  };

  late SpotifyApi spotify;
  String? access;
  String? refresh;

  static final Authentication _global = Authentication._internal();

  factory Authentication() {
    return _global;
  }

  Authentication._internal();

  Future<String> authentication() async {
    //variable assignment
    final credentials = SpotifyApiCredentials(keys['id'], keys['secret']);
    final grant = SpotifyApi.authorizationCodeGrant(credentials);
    //user authorization request
    final authUri = grant.getAuthorizationUrl(Uri.parse(keys['redirectUrl']),
        scopes: keys['scope']);
    try {
      //user authorization response
      final response = await FlutterWebAuth.authenticate(
          url: authUri.toString(), callbackUrlScheme: 'musickeando');

      if (response.contains('access_denied')) {
        return 'No se permitió el acceso';
      } else {
        //Auth Code Grant Assignment
        spotify = SpotifyApi.fromAuthCodeGrant(grant, response);
        final client = await spotify.client;
        //save access and refresh tokens
        saveTokens(client);

        print('accessToken: ${client.credentials.accessToken}');
        print('refreshToken: ${client.credentials.refreshToken}');
        client.close();
        return 'success';
      }
    } catch (e) {
      return 'Lo sentimos ocurrio un problema';
    }
  }

  Future reactiveToken() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    print(accessToken);
    print(refreshToken);
  }

  Future saveTokens(client) async {
    access = client.credentials.accessToken;
    refresh = client.credentials.refreshToken;
    final expired = client.credentials.expiration;
    await _storage.write(key: 'accessToken', value: access);
    await _storage.write(key: 'refreshToken', value: refresh);
    await _storage.write(key: 'expired', value: expired.toString());
  }

  Future<String?> getAccessToken() async {
    final accessToken = await _storage.read(key: 'accessToken');
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    return refreshToken;
  }

  Future<String?> getExpired() async {
    final expired = await _storage.read(key: 'expired');
    return expired;
  }
}

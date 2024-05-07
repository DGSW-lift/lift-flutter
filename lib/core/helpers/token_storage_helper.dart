

import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:lift/core/common/models/authentication.dart';

class TokenStorage {
  static final TokenStorage _instance =
  TokenStorage._internal();

  factory TokenStorage() {
    return _instance;
  }

  TokenStorage._internal();

  final String _accessToken = 'accessToken';
  final String _refreshToken = 'refreshToken';

  Future<void> save(Authentication authentication) async {
    await FlutterKeychain.put(key: _accessToken, value: authentication.accessToken);
    await FlutterKeychain.put(key: _refreshToken, value: authentication.refreshToken ?? "");
  }

  Future<String?> getAccessToken() async {
    return await FlutterKeychain.get(key: _accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await FlutterKeychain.get(key: _refreshToken);
  }

  Future<void> clear() async {
    await FlutterKeychain.remove(key: _accessToken);
    await FlutterKeychain.remove(key: _refreshToken);
  }

}

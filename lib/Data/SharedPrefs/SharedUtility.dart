import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swfl/Data/Model/OtpVerifyModel.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  String getToken() {
    return sharedPreferences.getString('token') ?? "";
  }

  void setToken(String token) {
    sharedPreferences.setString('token', token);
  }

  Data? getUser() {
    return sharedPreferences.get('user') != null
        ? Data.fromMap(jsonDecode(sharedPreferences.getString('user') ?? ""))
        : null;
  }

  void setUser(Data? userMap) {
    sharedPreferences.setString('user', jsonEncode(userMap!.toMap()));
  }
}

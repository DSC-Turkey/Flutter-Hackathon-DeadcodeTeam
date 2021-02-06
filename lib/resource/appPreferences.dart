import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppPreferences {
  // Default Preference Values' data types
  static const String PREFERENCE_TYPE_INT = "INTEGER";
  static const String PREFERENCE_TYPE_STRING = "STRING";
  static const String PREFERENCE_TYPE_DOUBLE = "DOUBLE";
  static const String PREFERENCE_TYPE_BOOL = "BOOL";

  // App-in Preferences
  static const String PREFERENCE_IS_LOGIN = "IS_LOGIN";

  // Default Preference Value for Splash screen time
  // interval in order that the app be ready.
  Future _isPreferencesReady;

  SharedPreferences _appPreferences;

  // Static App Preference with Private Constructor
  static final AppPreferences _instance = new AppPreferences._internal();
  factory AppPreferences() => _instance;

  AppPreferences._internal() {
    _isPreferencesReady = SharedPreferences.getInstance()
        .then((preferences) => _appPreferences = preferences);
  }

  Future get isPreferencesReady => _isPreferencesReady;

  Future<bool> getIsLogin() async =>
      await _getPreference(preferenceName: PREFERENCE_IS_LOGIN) ?? false;

  void _setAppPreferences({
    @required String preferenceName,
    @required dynamic preferenceValue,
    @required String preferenceType,
  }) {
    switch (preferenceType) {
      case PREFERENCE_TYPE_INT:
        _appPreferences.setInt(preferenceName, preferenceValue);
        break;

      case PREFERENCE_TYPE_STRING:
        _appPreferences.setString(preferenceName, preferenceValue);
        break;

      case PREFERENCE_TYPE_DOUBLE:
        _appPreferences.setDouble(preferenceName, preferenceValue);
        break;

      case PREFERENCE_TYPE_BOOL:
        _appPreferences.setBool(preferenceName, preferenceValue);
        break;
    }
  }

  Future<dynamic> _getPreference({
    @required preferenceName,
  }) async {
    return _appPreferences.get(preferenceName);
  }
}

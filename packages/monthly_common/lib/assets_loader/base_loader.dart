import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

abstract class BaseLoader extends AssetLoader {
  const BaseLoader(this.packageName);
  final String packageName;

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    try {
      final localePath = locale.toString();
      final fullPath = getAssetPath(localePath);
      final data = await rootBundle.loadString(fullPath);
      final result = json.decode(data) as Map<String, dynamic>;
      return {packageName: result}; // Namespace by package
    } on Exception catch (e) {
      log('Error loading $packageName translations: $e');
      return {};
    }
  }

  String getAssetPath(String localePath);
}

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:g_json/g_json.dart';

class JSONTransformer extends SyncTransformer {
  JSONTransformer() : super(jsonDecodeCallback: _decodeJson);
}

FutureOr<dynamic> _decodeJson(String text) {
  // Taken from https://github.com/flutter/flutter/blob/135454af32477f815a7525073027a3ff9eff1bfd/packages/flutter/lib/src/services/asset_bundle.dart#L87-L93
  // 50 KB of data should take 2-3 ms to parse on a Moto G4, and about 400 μs
  // on a Pixel 4.
  if (text.codeUnits.length < 50 * 1024) {
    return JSON.parse(text);
  }
  return compute(JSON.parse, text);
}

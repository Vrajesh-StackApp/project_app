//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:audio_service_web/audio_service_web.dart';
import 'package:audio_session/audio_session_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:just_audio_web/just_audio_web.dart';
import 'package:location_web/location_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AudioServiceWeb.registerWith(registrar);
  AudioSessionWeb.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  JustAudioPlugin.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}

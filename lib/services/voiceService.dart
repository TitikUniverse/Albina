import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
List<String> _newVoiceText = [];

_speak() async {
  await flutterTts.setLanguage("ru-RU");
  await flutterTts.setSpeechRate(0.5); //скорость
  await flutterTts.setVolume(1.0); //звук
  await flutterTts.setPitch(1.1); //тональность

  if (Platform.isIOS) {
    await flutterTts.setSharedInstance(true);
    await flutterTts
      .setIosAudioCategory(IosTextToSpeechAudioCategory.playAndRecord, [
      IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      IosTextToSpeechAudioCategoryOptions.mixWithOthers
    ]);
  }
  
  while (_newVoiceText.length > 0) {
    await flutterTts.speak(_newVoiceText[0]);
    // await flutterTts.speak(" ");
    await flutterTts.awaitSpeakCompletion(true);
    _newVoiceText.removeAt(0);
  }
}

addTextToSpeak(msg) {
  _newVoiceText.add(msg);
  if (_newVoiceText.length == 1) _speak(); 
}

stopSpeak() {
  flutterTts.stop();
}

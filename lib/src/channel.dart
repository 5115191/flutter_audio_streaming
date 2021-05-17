import 'package:flutter/services.dart';

final MethodChannel _channel =
    const MethodChannel('plugins.flutter.io/flutter_audio_streaming');

class RecordingChannel extends RecordingBaseChannel {
  @override
  initialize(String path) async {
    return _channel.invokeMapMethod<String, dynamic>(
      'initializeRecording',
      <String, dynamic>{'path': path},
    );
  }

  @override
  getStatistics() async {
    return _channel.invokeMapMethod<String, dynamic>('getStatistics');
  }

  @override
  prepare(
      {int bitrate,
      int sampleRate,
      bool isStereo,
      bool echoCanceler,
      noiseSuppressor}) async {
    return _channel.invokeMapMethod<String, dynamic>(
      'prepare',
      <String, dynamic>{},
    );
  }

  @override
  start() async {
    return await _channel.invokeMapMethod<String, dynamic>('startRecording');
  }

  @override
  pause() async {
    return _channel.invokeMapMethod<String, dynamic>('pauseRecording');
  }

  @override
  resume() async {
    return _channel.invokeMapMethod<String, dynamic>('resumeRecording');
  }

  @override
  stop() async {
    return _channel.invokeMapMethod<String, dynamic>(
      'stopRecording',
      <String, dynamic>{},
    );
  }

  @override
  dispose() async {
    return _channel.invokeMapMethod<String, dynamic>(
      'disposeRecording',
      <String, dynamic>{},
    );
  }
}

class StreamingChannel extends StreamingBaseChannel {
  @override
  initialize() async {
    return _channel.invokeMapMethod<String, dynamic>('initializeStreaming');
  }

  @override
  getStatistics() async {
    return _channel.invokeMapMethod<String, dynamic>(
      'getStatistics',
      <String, dynamic>{},
    );
  }

  @override
  prepare(
      {int bitrate,
      int sampleRate,
      bool isStereo,
      bool echoCanceler,
      noiseSuppressor}) async {
    return _channel.invokeMapMethod<String, dynamic>(
      'prepare',
      <String, dynamic>{},
    );
  }

  @override
  start(String url) async {
    return _channel.invokeMapMethod<String, dynamic>(
      'startStreaming',
      <String, dynamic>{"url": url},
    );
  }

  @override
  stopStreaming() async {
    return _channel.invokeMapMethod<String, dynamic>(
      'stopStreaming',
      <String, dynamic>{},
    );
  }

  @override
  dispose() async {
    return _channel.invokeMapMethod<String, dynamic>(
      'disposeStreaming',
      <String, dynamic>{},
    );
  }
}

abstract class StreamingBaseChannel extends _BaseChannel {
  initialize();

  start(String url);

  stopStreaming();

  dispose();
}

abstract class RecordingBaseChannel extends _BaseChannel {
  initialize(String path);

  start();

  pause();

  resume();

  stop();

  dispose();
}

abstract class _BaseChannel {
  prepare(
      {int bitrate,
      int sampleRate,
      bool isStereo,
      bool echoCanceler,
      noiseSuppressor});

  getStatistics();
}

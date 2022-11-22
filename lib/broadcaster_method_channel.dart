import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'broadcaster_platform_interface.dart';

/// An implementation of [BroadcasterPlatform] that uses method channels.
class MethodChannelBroadcaster extends BroadcasterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('broadcaster');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> broadcast(String channel, Map<String, dynamic> data) async {
    Map<String, dynamic> arguments = {'channel': channel, 'data': data};
    final result =
        await methodChannel.invokeMethod<int>('broadcastMessage', arguments);
    return result;
  }
}

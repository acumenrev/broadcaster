import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'broadcaster_method_channel.dart';

abstract class BroadcasterPlatform extends PlatformInterface {
  /// Constructs a BroadcasterPlatform.
  BroadcasterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BroadcasterPlatform _instance = MethodChannelBroadcaster();

  /// The default instance of [BroadcasterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBroadcaster].
  static BroadcasterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BroadcasterPlatform] when
  /// they register themselves.
  static set instance(BroadcasterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> broadcast(String channel, Map<String, dynamic> data) {
    throw UnimplementedError(
        'broadcast(channel, daya) has not been implemented.');
  }
}

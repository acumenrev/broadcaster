import 'broadcaster_platform_interface.dart';

class Broadcaster {
  Future<String?> getPlatformVersion() {
    return BroadcasterPlatform.instance.getPlatformVersion();
  }

  Future<int?> broadcast(String channel, Map<String, dynamic> data) {
    return BroadcasterPlatform.instance.broadcast(channel, data);
  }
}

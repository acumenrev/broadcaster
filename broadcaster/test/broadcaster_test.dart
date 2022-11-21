import 'package:flutter_test/flutter_test.dart';
import 'package:broadcaster/broadcaster.dart';
import 'package:broadcaster/broadcaster_platform_interface.dart';
import 'package:broadcaster/broadcaster_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBroadcasterPlatform
    with MockPlatformInterfaceMixin
    implements BroadcasterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int?> broadcast(String channel, Map<String, dynamic> data) =>
      Future.value(1);
}

void main() {
  final BroadcasterPlatform initialPlatform = BroadcasterPlatform.instance;

  test('$MethodChannelBroadcaster is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBroadcaster>());
  });

  test('getPlatformVersion', () async {
    Broadcaster broadcasterPlugin = Broadcaster();
    MockBroadcasterPlatform fakePlatform = MockBroadcasterPlatform();
    BroadcasterPlatform.instance = fakePlatform;

    expect(await broadcasterPlugin.getPlatformVersion(), '42');
  });
}

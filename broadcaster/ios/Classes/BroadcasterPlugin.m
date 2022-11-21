#import "BroadcasterPlugin.h"
#if __has_include(<broadcaster/broadcaster-Swift.h>)
#import <broadcaster/broadcaster-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "broadcaster-Swift.h"
#endif

@implementation BroadcasterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBroadcasterPlugin registerWithRegistrar:registrar];
}
@end

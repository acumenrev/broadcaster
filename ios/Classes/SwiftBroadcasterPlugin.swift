import Flutter
import UIKit

public class SwiftBroadcasterPlugin: NSObject, FlutterPlugin {

  let methodBroadcastMessage = "broadcastMessage"

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "broadcaster", binaryMessenger: registrar.messenger())
    let instance = SwiftBroadcasterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    switch (call.method) {
      case methodBroadcastMessage:
        if let args = call.arguments as? [String : Any], let channel = args["channel"] as? String {
          self.sendMessageToNotificationCenter(channel: channel,data: args["data"])
          // Emit value 1 to notify that the plugin has added a notification to NotificationCenter
          result(5)
        } else {
          // Emit value 0 to plugin 
          result(0);
        }
        break
      default:
        print("Broadcaster: method is not supported")
        break
    }
  }

  private func sendMessageToNotificationCenter(channel : String, data : Any?) {
    NotificationCenter.default.post(name: NSNotification.Name(channel), object: data)
  }
}

// Autogenerated from Pigeon (v17.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func createConnectionError(withChannelName channelName: String) -> FlutterError {
  return FlutterError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum LoggingLevel: Int {
  /// Verbose log data to understand how the code executes.
  case debug = 0
  /// Logs related to normal application behavior.
  case info = 1
  /// To log a situation that might be a problem, or an unusual situation.
  case warning = 2
  /// A log message providing information when a significant error occurred
  case error = 3
}
/// An interface for implementing log writing backends, e.g. for using platform specific log backends or logging to a notification service.
///
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol LogWriterBackendProtocol {
  /// Writes a log message with a given level.
  func writeLog(level levelArg: LoggingLevel, message messageArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void)
}
class LogWriterBackend: LogWriterBackendProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger) {
    self.binaryMessenger = binaryMessenger
  }
  /// Writes a log message with a given level.
  func writeLog(level levelArg: LoggingLevel, message messageArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.mapbox_maps_flutter.LogWriterBackend.writeLog"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([levelArg.rawValue, messageArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}

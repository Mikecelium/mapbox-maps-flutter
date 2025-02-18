// Autogenerated from Pigeon (v17.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

part of mapbox_maps_flutter;

enum LoggingLevel {
  /// Verbose log data to understand how the code executes.
  debug,

  /// Logs related to normal application behavior.
  info,

  /// To log a situation that might be a problem, or an unusual situation.
  warning,

  /// A log message providing information when a significant error occurred
  error,
}

/// An interface for implementing log writing backends, e.g. for using platform specific log backends or logging to a notification service.
abstract class LogWriterBackend {
  static const MessageCodec<Object?> pigeonChannelCodec =
      StandardMessageCodec();

  /// Writes a log message with a given level.
  void writeLog(LoggingLevel level, String message);

  static void setup(LogWriterBackend? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.LogWriterBackend.writeLog',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.LogWriterBackend.writeLog was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final LoggingLevel? arg_level =
              args[0] == null ? null : LoggingLevel.values[args[0]! as int];
          assert(arg_level != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.LogWriterBackend.writeLog was null, expected non-null LoggingLevel.');
          final String? arg_message = (args[1] as String?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.LogWriterBackend.writeLog was null, expected non-null String.');
          try {
            api.writeLog(arg_level!, arg_message!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

/// Class that represents an exception that occurs during the data
/// deserialization process.
///
/// This exception is thrown when an error occurs while trying to convert
/// an object in JSON format to an instance of a class in Dart.
///
/// ### Properties:
/// - `message`: A descriptive message that explains the reason for the exception.
/// - `source`: An optional argument that can contain the input data
///   that caused the error. This can be useful for debugging, as it allows
///   developers to identify which specific data triggered the failure.
///
/// ### Usage:
/// The `DeserializationException` class is used in the context of
/// deserializing objects, which is the process of converting data in
/// JSON format into instances of classes in Dart. For example, if a JSON
/// is expected to have a specific structure and that structure is not
/// respected, this exception can be thrown.
///
/// #### Example:
/// ```dart
/// Future<dynamic> fromJson(Map<String, dynamic> json, Object obj) async {
///   if (json.isEmpty) {
///     throw DeserializationException('The JSON is empty', json);
///   }
///   // Rest of the deserialization code...
/// }
/// ```
///
/// In the above example, if the JSON is empty, a
/// `DeserializationException` is thrown with a message explaining the error
/// and the empty JSON as the source.
///
/// ### Handling the Exception:
/// Developers using this class can catch it in a `try-catch` block to
/// handle the error in a controlled manner. This allows for the
/// implementation of specific logic for failed deserialization situations,
/// improving user experience and facilitating debugging.
///
/// #### Example of Handling:
/// ```dart
/// try {
///   var myObject = await ModelBaseApi().fromJson(invalidJson, MyClass());
/// } catch (e) {
///   if (e is DeserializationException) {
///     print('An error occurred during deserialization: ${e.message}');
///     print('Problematic data: ${e.source}');
///   }
/// }
/// ```
///
/// In this case, if a `DeserializationException` is thrown, the
/// `catch` block captures the exception and allows the developer to handle
/// the error specifically, providing clear messages to the user
/// about what went wrong.
class DeserializationException implements Exception {
  final String message;
  final dynamic source;

  DeserializationException(this.message, [this.source]);

  @override
  String toString() {
    if (source == null) {
      return 'DeserializationException: $message';
    } else {
      return 'DeserializationException: $message. Source: $source';
    }
  }
}

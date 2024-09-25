/// Class that represents an exception that occurs during the data
/// serialization process.
///
/// This exception is thrown when an error occurs while trying to convert
/// an object into a JSON format or another serializable format.
///
/// ### Properties:
/// - `message`: A descriptive message that explains the reason for the exception.
/// - `source`: An optional argument that can contain the input data
///   that caused the error. This can be useful for debugging, as it allows
///   developers to identify which specific data triggered the failure.
///
/// ### Usage:
/// The `SerializationException` class is used in the context of
/// serializing objects, which is the process of converting instances of
/// classes in Dart into a format suitable for storage or transmission,
/// such as JSON. For example, if an object does not meet the necessary
/// criteria for serialization (e.g., missing required fields), this
/// exception can be thrown.
///
/// #### Example:
/// ```dart
/// String serializeUser(User user) {
///   if (user.name.isEmpty) {
///     throw SerializationException('User name cannot be empty', user);
///   }
///   // Rest of the serialization code...
/// }
/// ```
///
/// In the above example, if the `user` object's name is empty, a
/// `SerializationException` is thrown with a message explaining the error
/// and the problematic `user` object as the source.
///
/// ### Handling the Exception:
/// Developers using this class can catch it in a `try-catch` block to
/// handle the error in a controlled manner. This allows for the
/// implementation of specific logic for failed serialization situations,
/// improving user experience and facilitating debugging.
///
/// #### Example of Handling:
/// ```dart
/// try {
///   String jsonString = serializeUser(myUser);
/// } catch (e) {
///   if (e is SerializationException) {
///     print('An error occurred during serialization: ${e.message}');
///     print('Problematic data: ${e.source}');
///   }
/// }
/// ```
///
/// In this case, if a `SerializationException` is thrown, the
/// `catch` block captures the exception and allows the developer to handle
/// the error specifically, providing clear messages to the user
/// about what went wrong.
class SerializationException implements Exception {
  final String message;
  final dynamic source;

  SerializationException(this.message, [this.source]);

  @override
  String toString() {
    if (source == null) {
      return 'SerializationException: $message';
    } else {
      return 'SerializationException: $message. Source: $source';
    }
  }
}

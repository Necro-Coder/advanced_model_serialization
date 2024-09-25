
/// Class that represents an exception that occurs when there is a failure
/// in executing the main command of the package.
///
/// This exception is thrown when an error occurs during the execution of a
/// command that is critical to the functionality of the package.
///
/// ### Properties:
/// - `message`: A descriptive message that explains the reason for the exception.
/// - `source`: An optional argument that can contain the input data
///   that caused the error. This can be useful for debugging, as it allows
///   developers to identify which specific command or parameters triggered the failure.
///
/// ### Usage:
/// The `AmsCommandException` class is used in the context of executing
/// commands within the package. If the command fails due to various
/// reasons, such as invalid parameters, communication issues, or any
/// unexpected behavior, this exception can be thrown.
///
/// #### Example:
/// ```dart
/// void executeCommand(String command) {
///   if (!isValidCommand(command)) {
///     throw AmsCommandException('Invalid command provided: $command', command);
///   }
///   // Rest of the command execution code...
/// }
/// ```
///
/// In the above example, if an invalid command is provided, an
/// `AmsCommandException` is thrown with a message explaining the error
/// and the problematic command as the source.
///
/// ### Handling the Exception:
/// Developers using this class can catch it in a `try-catch` block to
/// handle the error in a controlled manner. This allows for the
/// implementation of specific logic for failed command executions,
/// improving user experience and facilitating debugging.
///
/// #### Example of Handling:
/// ```dart
/// try {
///   executeCommand(myCommand);
/// } catch (e) {
///   if (e is AmsCommandException) {
///     print('An error occurred while executing the command: ${e.message}');
///     print('Problematic command: ${e.source}');
///   }
/// }
/// ```
///
/// In this case, if an `AmsCommandException` is thrown, the
/// `catch` block captures the exception and allows the developer to handle
/// the error specifically, providing clear messages to the user
/// about what went wrong.
class AmsCommandException implements Exception {
  final String message;
  final dynamic source;

  AmsCommandException(this.message, [this.source]);

  @override
  String toString() {
    if (source == null) {
      return 'AmsCommandException: $message';
    } else {
      return 'AmsCommandException: $message. Source: $source';
    }
  }
}

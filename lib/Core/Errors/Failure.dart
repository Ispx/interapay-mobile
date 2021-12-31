
abstract class Failure implements Exception {
  @override
  String toString() => '$runtimeType Exception';
}

class GenericException extends Failure {}

class ApiException extends Failure {}

class DatabaseException extends Failure {
  DatabaseException([this.message]);

  final String? message;
}

class MessageException extends Failure {
  MessageException(this.message) : assert(message.isNotEmpty, 'Use another Failure for a failure without a message');

  final String message;
}

class ServerErrorException implements Exception {
  final String message;

  ServerErrorException({
    required this.message
  });

  @override
  String toString() {
    return message;
  }
}
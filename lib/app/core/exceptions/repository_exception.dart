class RepositoryException implements Exception {
  final String message;
  final StackTrace? stacktrace;

  RepositoryException({
    required this.message,
    this.stacktrace,
  });
}

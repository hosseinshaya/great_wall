class BaseException implements Exception {
  BaseException({required this.message, this.code});
  final String message;
  int? code = 0;
}
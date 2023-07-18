import '../../exceptions/app_exceptions.dart';

class HttpException implements AppException {
  @override
  final String message;

  const HttpException(
    this.message, {
    required this.stackTrace,
  });

  @override
  final StackTrace? stackTrace;
}

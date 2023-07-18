import 'http_response.dart';

abstract interface class HttpService {
  Future<HttpResponse> get(String path);
}

enum HttpVerbsType {
  get,
  post,
}

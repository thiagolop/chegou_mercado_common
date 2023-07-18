class HttpResponse {
  final dynamic data;
  final List<int> dataAsBytes;

  const HttpResponse({
    required this.data,
    required this.dataAsBytes,
  });
}

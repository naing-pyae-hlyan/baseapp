import 'package:http/http.dart' as http;

import 'enums.dart';

class Response {
  ResponseStatus status;
  http.Response? response;

  Response({required this.status, this.response});
}

class StreamedResponse {
  ResponseStatus status;
  http.StreamedResponse? response;

  StreamedResponse({required this.status, this.response});
}

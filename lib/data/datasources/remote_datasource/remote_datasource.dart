import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource(this.client);
}

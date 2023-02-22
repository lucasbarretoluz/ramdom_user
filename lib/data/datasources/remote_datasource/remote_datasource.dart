import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ramdom_user/data/datasources/api.dart';
import 'package:ramdom_user/data/model/user_model.dart';

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource(this.client);

  Future<UserResponseModel> getUsers() async {
    String gender = "";
    String urlPart = '?page=1&results=15&gender=$gender&nat=BR';
    Uri url = Uri.parse(Api.apiUrl + urlPart);

    try {
      http.Response response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        UserResponseModel modelResponse =
            UserResponseModel.fromJson(json.decode(response.body));
        return modelResponse;
      }
    } catch (e) {
      throw Exception();
    }

    throw Exception();
  }
}

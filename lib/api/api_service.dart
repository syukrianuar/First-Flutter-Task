import 'dart:convert';
import 'package:fluttertraining/model/login_model.dart';
import 'package:http/http.dart' as http;

class APIService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://regres.in/api/login";

    final response = await http.post(Uri.parse(url), body: requestModel.tojson());
    if (response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromjson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Data');
    }
  }
}
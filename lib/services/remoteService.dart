
import 'dart:convert';

import 'package:flutter_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {

  
  static Future<List<UserModel>> getData() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    
    if(response.statusCode == 200) {
      List jsonRes = json.decode(response.body);

      return jsonRes.map((e) => 
        UserModel.fromJson(e)
      ).toList();
    } else {
      throw Exception('Unexcepted error occured');
    }
  }
}
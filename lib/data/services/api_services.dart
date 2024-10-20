import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ApiServices{

  //get api
  static Future<http.Response> getApi(String url) async {
    var data = await http.get(Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      }
    );

    print("GET API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("GET API RESPONSE URL: ${url}");
    print("GET API RESPONSE BODY: ${data.body}");
    print("GET API RESPONSE STATUS CODE: ${data.statusCode}");

    return data;
  }


  //post api
  static Future<http.Response> postApi(String url, dynamic body) async {
    var data = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      },
      body: jsonEncode(body)
    );

    print("POST API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("POST API RESPONSE URL: ${url}");
    print("POST API RESPONSE BODY: ${data.body}");
    print("POST API RESPONSE STATUS CODE: ${data.statusCode}");


    return data;
  }


  //put api
  static Future<http.Response> putApi(String url, dynamic body) async {
    return await http.put(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      },
      body: jsonEncode(body)
    );
  }


  //delete api
  static Future<http.Response> deleteApi(String url) async {
    return await http.delete(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      }
    );
  }



  //post api without token
  static Future<http.Response> postApiWithoutToken(String url, dynamic body) async {
    return await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body)
    );
  }

}
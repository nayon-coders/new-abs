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

  //patch
  static Future<http.Response> patchApi( String url,  Map<String, dynamic> body)async{
    var data = await http.patch(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
        },
        body: jsonEncode(body)
    );

    print("PATCH API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("PATCH API RESPONSE URL: ${url}");
    print("PATCH API RESPONSE BODY: ${data.body}");
    print("PATCH API RESPONSE STATUS CODE: ${data.statusCode}");

    return data;
  }


  //put api
  static Future<http.Response> putApi(String url, dynamic body) async {
    var data = await http.put(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      },

      body: jsonEncode(body)
    );

    print("PUT API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("PUT API RESPONSE URL: ${url}");
    print("PUT API RESPONSE BODY: ${data.body}");
    print("PUT API RESPONSE STATUS CODE: ${data.statusCode}");

    return data;
  }


  //delete api
  static Future<http.Response> deleteApi(String url) async {
    var data = await http.delete(Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${sharedPreferences!.getString("token")}'
      }
    );
    print("DELETE API RESPONSE TOKEN: ${sharedPreferences!.getString("token")}");
    print("DELETE API RESPONSE URL: ${url}");
    print("DELETE API RESPONSE BODY: ${data.body}");
    print("DELETE API RESPONSE STATUS CODE: ${data.statusCode}");
    return data;
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
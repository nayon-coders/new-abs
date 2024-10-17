import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiController{

  //get
  static Future<http.Response> getApi(String url)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    final response = await http.get(Uri.parse(url),
      headers: {
      "Authorization" : "Bearer $token"
      }
    );
    debugPrint("----getApi URL ---${token}");
    debugPrint("----getApi URL ---${url}");
    debugPrint("----getApi status Code ---${response.statusCode}");
    debugPrint("----getApi body ---${response.body}");
    return response;

  }


  //post
  static Future<http.Response> postApi({required String URL,required dynamic body})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final token = _pref.getString("token");
    final response = await http.post(Uri.parse(URL),
    body: jsonEncode(body),
      headers: {
      "Content-Type":"application/json",
        "Authorization":"Bearer $token"
      }
    );
    debugPrint(".....postApi token .....$token");
    debugPrint(".....postApi URL .....$URL");
    debugPrint(".....postApi status Code .....${response.statusCode}");
    debugPrint("..... postApi body .....${response.body}");
    return response;
  }

  //put
  static Future<http.Response>putApi({required String URL,required Map<String, dynamic>body})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final token = _pref.getString("token");
    final role = _pref.getString("role");
    final response = await http.put(Uri.parse(URL),
    body: jsonEncode(body),
    headers: {
      "Content-Type":'application/json',
      "Authorization":"Bearer $token"

    }
    );

    debugPrint("......putApi URL ......$URL");
    debugPrint("......putApi status code ......${response.statusCode}");
    debugPrint("......putApi token ......$token");
    debugPrint("......putApi body ......${response.body}");
    return response;
  }

  //delete
  static Future<http.Response> deleteApi({required String URL})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("token");
    final response = await http.delete(Uri.parse(URL),
    headers: {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token",
    });

    debugPrint("......deleteApi Url .......$URL");
    debugPrint("......deleteApi status code .......${response.statusCode}");
    debugPrint("......deleteApi body .......${response.body}");
    return response;
  }


  //patch
  static Future<http.Response> patchApi({required String URL,required Map<String,dynamic>body})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final token = _pref.getString("token");
    final response = await http.patch(Uri.parse(URL),
    body: jsonEncode(body),
    headers: {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token"
    });
    debugPrint(".......getApi URL....$URL");
    debugPrint(".......getApi body....${response.body}");
    debugPrint(".......getApi status code....${response.statusCode}");
    return response;
  }


}
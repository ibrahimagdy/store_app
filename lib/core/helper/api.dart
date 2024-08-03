import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api{

  Future<dynamic> getRequest({required String url}) async{
   http.Response response = await http.get(Uri.parse(url));
   if(response.statusCode == 200){
     print('pppppppp${response.body}');
     return jsonDecode(response.body);
   }
   else{
     throw Exception('There is an error ${response.statusCode}');
   }
  }

  Future<dynamic> postRequest({required String url, @required dynamic body,String? token}) async{
    Map<String, String>? headers = {};
    if(token != null){
      headers.addAll(
        {'Authorization': 'Bearer $token'},
      );
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers
    );
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception('There is an error ${response.statusCode}');
    }
  }

  Future<dynamic> putRequest({required String url, @required dynamic body,String? token}) async{
    Map<String, String>? headers = {};
    headers.addAll({
      'Content-Type' : 'application/x-www-form-urlencoded',
    });
    if(token != null){
      headers.addAll(
        {'Authorization': 'Bearer $token'},
      );
    }
    print('url = $url body = $body token = $token ');
    http.Response response = await http.put(
        Uri.parse(url),
        body: body,
        headers: headers
    );
    if(response.statusCode == 200){
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }
    else{
      throw Exception('There is an error ${response.statusCode}');
    }
  }

}
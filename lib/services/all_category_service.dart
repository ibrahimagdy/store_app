import 'dart:convert';
import 'package:http/http.dart' as http;

class AllCategoryService{

  Future<List<dynamic>> getAllCategory() async{
    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if(response.statusCode == 200){
      List<dynamic> data =  jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('There is an error ${response.statusCode}');
    }
  }
}
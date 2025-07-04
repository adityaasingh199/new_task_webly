import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper{
  Future<dynamic> getAPI()async{
    var uri = (Uri.parse("https://fakestoreapi.in/api/products?page=4&limit=10"));
    var res = await http.get(uri);
    Map<String,dynamic> mData = jsonDecode(res.body);
    return mData;
  }
}
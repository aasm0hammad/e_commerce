import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

class ApiHelper {
  Future<dynamic> postAPI(
      {required String url,
      Map<String, String>? mHeaders,
      Map<String, dynamic>? params,
      bool isAuth = false})async {
    if (!isAuth) {}

   try{
     var res=await http.post(Uri.parse(url),
         body: params != null ? jsonEncode(params) : null, headers: mHeaders);
print(res.body);
     return returnResponse(res);
   }on SocketException catch(e){
      throw NoInternetException(errorMessage: e.toString());
   }

   }
  }
  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(errorMessage: response.body);
      case 401:
      case 403:
        throw UnauthorisedException(errorMessage: response.body);
      case 500:
      default:
        throw FetchDataException(errorMessage: response.body);
    }

  }

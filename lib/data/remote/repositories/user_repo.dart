import 'package:e_commerce/data/remote/helper/api_helper.dart';

import '../../../utills/app_url/app_urls.dart';

class UserRepo{

  ApiHelper apiHelper;
  UserRepo({required this.apiHelper});



  Future<dynamic> registerUser({required Map<String, dynamic> bodyParams}) async{
    try{
      dynamic res = await apiHelper.postAPI(
        url: AppUrls.registerUrl,
        isAuth: true,
        params: bodyParams,
      );
      return res;
    } catch(e){
      rethrow;
    }
  }

  Future<dynamic> loginUser({required Map<String,dynamic> bodyParams})async{

    try{
      dynamic res= await apiHelper.postAPI(
          url: AppUrls.loginUrl,
          isAuth: true,
          params: bodyParams

      );
      return res;
    }catch(e){
      rethrow;
    }
  }


}
import 'package:e_commerce/data/remote/helper/api_helper.dart';
import 'package:e_commerce/utills/app_url/app_urls.dart';

class ProductRepo {
  ApiHelper apiHelper;

  ProductRepo({required this.apiHelper});

  Future<dynamic> getAllProducts() async {
    try {
      dynamic res = apiHelper.postAPI(url: AppUrls.productsUrl);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}

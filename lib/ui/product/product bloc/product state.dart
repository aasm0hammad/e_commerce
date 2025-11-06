import 'package:e_commerce/data/remote/models/product_model.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  List<ProductModel> products;

  ProductLoadedState({required this.products});
}

class ProductErrorsState extends ProductState {
  String msg;

  ProductErrorsState({required this.msg});
}

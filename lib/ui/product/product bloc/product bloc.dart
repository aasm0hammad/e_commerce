

import 'package:e_commerce/ui/product/product%20bloc/product%20event.dart';
import 'package:e_commerce/ui/product/product%20bloc/product%20state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/models/product_model.dart';
import '../../../data/remote/repositories/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{

  ProductRepo productRepo;

  ProductBloc({required this.productRepo}): super(ProductInitialState()){

    on<GetAllProductEvent>((event ,emit)async{

      emit(ProductLoadingState());

      try{

        dynamic res = await productRepo.getAllProducts();
        print(res["status"]);
        if(res["status"]){
          print(res);
          var dataModel = ProductDataModel.fromJson(res);
          emit(ProductLoadedState(products: dataModel.data ?? []));
        } else {
          emit(ProductErrorsState(msg: res["message"]));
        }

      } catch(e){
        emit(ProductErrorsState(msg: e.toString()));

      }

    });


  }


}
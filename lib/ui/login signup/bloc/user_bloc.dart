import 'package:e_commerce/ui/login%20signup/bloc/user_event.dart';
import 'package:e_commerce/ui/login%20signup/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/remote/repositories/user_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepo userRepo;

  UserBloc({required this.userRepo}) : super(UserInitialState()) {

    /// SignUp
    on<SignUpEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        var res = await userRepo.registerUser(bodyParams: event.bodyParam);
        if (res["status"]) {
          ///
          SharedPreferences pre=await SharedPreferences.getInstance();
          pre.setString("token", res["token"]);

          emit(UserSuccessState());
        } else {
          emit(UserFailureState(errorMsg: res["message"]));
        }
      } catch (e) {
        emit(UserFailureState(errorMsg: e.toString()));
      }
    });

    /// Login

    on<LoginEvent>((event, emit)async{

      emit(UserLoadingState());
      try{
        var res = await userRepo.loginUser(bodyParams: event.bodyParams);
        if(res['status']){
          emit(UserSuccessState());
          
        }else{
          emit(UserFailureState(errorMsg: res['message']));
        }

      }catch(e){
        emit(UserFailureState(errorMsg: e.toString()));
      }

    });


  }
}
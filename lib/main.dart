import 'package:e_commerce/data/remote/helper/api_helper.dart';
import 'package:e_commerce/data/remote/repositories/product_repo.dart';
import 'package:e_commerce/data/remote/repositories/user_repo.dart';
import 'package:e_commerce/ui/detailspage.dart';
import 'package:e_commerce/ui/homepage.dart';
import 'package:e_commerce/ui/login%20signup/bloc/user_bloc.dart';
import 'package:e_commerce/ui/login%20signup/loginsignup.dart';
import 'package:e_commerce/ui/product/product%20bloc/product%20bloc.dart';
import 'package:e_commerce/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context)=>UserBloc(userRepo: UserRepo(apiHelper: ApiHelper()))),
    BlocProvider(create: (context)=>ProductBloc(productRepo: ProductRepo(apiHelper: ApiHelper())))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false
      ,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}

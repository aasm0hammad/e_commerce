import 'dart:convert';

import 'package:e_commerce/ui/homepage.dart';
import 'package:e_commerce/ui/login%20signup/bloc/user_bloc.dart';
import 'package:e_commerce/ui/login%20signup/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/color/colors.dart';
import '../../repository/widget/ui_helper.dart';
import 'package:http/http.dart' as http;

import 'bloc/user_state.dart';

class LoginSignUp extends StatefulWidget {
  @override
  State<LoginSignUp> createState() => _SignUpState();
}

class _SignUpState extends State<LoginSignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLogin = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Primary.base,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      UiHelper.customText(
                          text: isLogin ? "Back to Register" : "Back to Login",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Primary.base,
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      UiHelper.customText(
                          text: isLogin ? "Let’s Login" : "Register",
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Neutral.black,
                          textAlign: TextAlign.start),

                      SizedBox(
                        height: 32,
                      ),
                      if (!isLogin)
                        UiHelper.customTextField(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Enter your name";
                              } else {
                                return null;
                              }
                            },
                            controller: nameController,
                            hint: "Example: John Doe",
                            label: "Full Name"),

                      SizedBox(
                        height: 16,
                      ),
                      UiHelper.customTextField(
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter your Email!..";
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          hint: "Example: johndoe@gmail.com",
                          label: "Email Address"),
                      SizedBox(
                        height: 16,
                      ),
                      if (!isLogin)
                        UiHelper.customTextField(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Enter your Phone!..";
                              } else {
                                return null;
                              }
                            },
                            controller: phoneController,
                            hint: "Example: 9874561233",
                            label: "Phone Number"),

                      SizedBox(
                        height: 16,
                      ),
                      UiHelper.customTextField(
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Password!";
                            } else {
                              return null;
                            }
                          },
                          controller: passController,
                          hint: "********",
                          label: "Password",
                          obscureText: true),
                      if (!isLogin)
                        SizedBox(
                          height: 16,
                        ),
                      if (!isLogin)
                        UiHelper.customTextField(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Enter confirm Password!";
                              } else {
                                return null;
                              }
                            },
                            controller: conPassController,
                            hint: "********",
                            label: "Confirm Password",
                            obscureText: true),
                      SizedBox(
                        height: 12,
                      ),
                      UiHelper.customText(
                          text: "Forgot Password",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Primary.base,
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 32,
                      ),

                      isLogin
                          ? BlocListener<UserBloc, UserState>(
                              listener: (_, state) {
                                if (state is UserLoadingState) {
                                  isLoading = true;
                                  setState(() {});
                                }
                                if (state is UserFailureState) {
                                  isLoading = false;
                                  ScaffoldMessenger.of(context)
                                      .showMaterialBanner(
                                    MaterialBanner(
                                        leading:
                                        Icon(Icons.info, color: Colors.red),
                                        content: Text(state.errorMsg),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentMaterialBanner();
                                              },
                                              child: Text("Dismiss"))
                                        ]),
                                  );
                                  Future.delayed(Duration(seconds: 3), () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentMaterialBanner();
                                  });
                                  setState(() {});
                                }
                                  if (state is UserSuccessState) {
                                    isLoading = false;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text("Login SuccessFully.."),
                                           ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));

                                }
                              },
                              child: UiHelper.customButton(
                                  child: isLoading
                                      ? Text("Loging...")
                                      : Text("Login"),
                                  color: Primary.base,
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    Map<String, dynamic> mParams = {
                                      "email": emailController.text,
                                      "password": passController.text
                                    };
                                    context
                                        .read<UserBloc>()
                                        .add(LoginEvent(bodyParams: mParams));
                                  }),
                            )
                          : BlocListener<UserBloc, UserState>(
                              listener: (_, state) {
                                if (state is UserLoadingState) {
                                  isLoading = true;
                                  setState(() {});
                                }
                                if (state is UserFailureState) {
                                  isLoading = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(state.errorMsg)));
                                  setState(() {});
                                }
                                if (state is UserSuccessState) {
                                  isLoading = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "User Registered Successfully")));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                }
                              },
                              child: UiHelper.customButton(
                                  child: isLoading
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Registering..")
                                          ],
                                        )
                                      : Text("Register"),
                                  color: Primary.base,
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    Map<String, dynamic> mParams = {
                                      "name": nameController.text,
                                      "mobile_number": phoneController.text,
                                      "email": emailController.text,
                                      "password": passController.text
                                    };
                                    context
                                        .read<UserBloc>()
                                        .add(SignUpEvent(bodyParam: mParams));
                                  }),
                            ),
                      /* ElevatedButton(onPressed: ()async{

                        if(formKey.currentState!.validate()) {
                          String url = 'https://ecommerceapi.projectnest.online/ecommerce-api/user/registration';

                          Map<String, dynamic> mParams = {
                            "name": nameController.text,
                            "mobile_number": phoneController.text,
                            "email": emailController.text,
                            "password": passController.text
                          };

                          print(mParams);
                          http.Response res= await http.post(Uri.parse(url),body:  jsonEncode(mParams));

                          if(res.statusCode==200){

                            Map<String,dynamic> mData= jsonDecode(res.body);
                            if(mData['status']){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${mData['message'] }")));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${mData['message'] }")));

                            }

                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${res.statusCode } : ${res.body}")));

                          }
                        }


                      }, child: Text("data")),
      */
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                          child: Text(
                        "or",
                        style: TextStyle(color: Colors.grey),
                      )),
                      SizedBox(
                        height: 16,
                      ),

                      ///Register with Google
                      UiHelper.customButton(
                          onPressed: () {
                            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text(isLogin
                              ? "Login with Google"
                              : "Register with Google"),
                          color: Neutral.white,
                          textColor: Neutral.black),
                      SizedBox(
                        height: isLogin ? 29 : 16,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                          child: UiHelper.customText(
                              text: isLogin
                                  ? "Don’t have any account? Register here"
                                  : "Already have an account? Login here",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Primary.base,
                              textAlign: TextAlign.center),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

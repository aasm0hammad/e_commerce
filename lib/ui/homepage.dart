import 'dart:math';

import 'package:e_commerce/repository/widget/ui_helper.dart';
import 'package:e_commerce/ui/detailspage.dart';
import 'package:e_commerce/ui/login%20signup/loginsignup.dart';
import 'package:e_commerce/ui/product/product%20bloc/product%20bloc.dart';
import 'package:e_commerce/ui/product/product%20bloc/product%20event.dart';
import 'package:e_commerce/ui/product/product%20bloc/product%20state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> categories = [
    {'icon': Icons.shopping_bag, 'label': 'Shoes'},
    {'icon': Icons.brush, 'label': 'Beauty'},
    {'icon': Icons.face, 'label': "Women's\nFashion"},
    {'icon': Icons.watch, 'label': 'Jewelry'},
    {'icon': Icons.person, 'label': "Men's\nFashion"},
    {'icon': Icons.shopping_bag, 'label': 'Shoes'},
    {'icon': Icons.brush, 'label': 'Beauty'},
    {'icon': Icons.face, 'label': "Women's\nFashion"},
    {'icon': Icons.watch, 'label': 'Jewelry'},
    {'icon': Icons.person, 'label': "Men's\nFashion"},
    {'icon': Icons.shopping_bag, 'label': 'Shoes'},
    {'icon': Icons.brush, 'label': 'Beauty'},
    {'icon': Icons.face, 'label': "Women's\nFashion"},
    {'icon': Icons.watch, 'label': 'Jewelry'},
    {'icon': Icons.person, 'label': "Men's\nFashion"},
  ];

  List<Map<String, dynamic>> forYouItems = [
    {
      'image':
          'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/3138c8f0-5929-48d7-8c58-9126f53d8463/NIKE+INTERACT+RUN+EASYON.png',
      'title': 'Running Shoes',
      'price': '\$59.99',
      'color': [Colors.red, Colors.greenAccent, Colors.lightBlue, Colors.yellow]
    },
    {
      'image':
          'https://m.media-amazon.com/images/I/61pIzNaNRWL._AC_UF1000,1000_QL80_.jpg',
      'title': 'Smart Watch',
      'price': '\$129.99',
      'color': [Colors.red, Colors.greenAccent, Colors.lightBlue, Colors.yellow]
    },
    {
      'image':
          'data:image/jpeg;base64,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',
      'title': 'Necklace',
      'price': '\$39.99',
      'color': [Colors.red, Colors.greenAccent, Colors.lightBlue, Colors.yellow]
    },
    {
      'image':
          'https://png.pngtree.com/png-vector/20190514/ourmid/pngtree-headphone-icon-vector-for-website-png-image_1039955.jpg',
      'title': 'Headphones',
      'price': '\$79.99',
      'color': [Colors.red, Colors.greenAccent, Colors.lightBlue, Colors.yellow]
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp2SsQtSagR2eh6ItHQCTmWJWZFt7krZrpaA&s',
      'title': "Men's Jacket",
      'price': '\$89.99',
      'color': [Colors.red, Colors.greenAccent, Colors.lightBlue, Colors.yellow]
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCdIpBxL12n85l-hEsFhVZb7GYg1a8KjV2w&s',
      'title': "Women's Dress",
      'price': '\$69.99',
      'color': [Colors.red, Colors.greenAccent, Colors.lightBlue, Colors.yellow]
    },
  ];

  @override
  Widget build(BuildContext context) {
      context.read<ProductBloc>().add(GetAllProductEvent());
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder()),
                        child: Icon(
                          Icons.menu,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async{
                         var pref=await SharedPreferences.getInstance();
                           pref.remove("token");
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSignUp()));

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder()),
                        child: Icon(
                          Icons.logout,
                          color: Colors.grey.shade600,
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          focusColor: Colors.teal,
                          fillColor: Color(0xFAB8B8B8),
                          hintText: "Search...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          suffixIcon: Icon(
                            Icons.more_vert,
                            color: Colors.grey.shade600,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                  ),
                  Center(
                      child: UiHelper.customText(
                          text: "Ecommerces",
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.yellow,
                          textAlign: TextAlign.center)),
                  SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                    child: Icon(
                                      categories[index]['icon'],
                                      size: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  UiHelper.customText(
                                      text: categories[index]['label'],
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color: Colors.black,
                                      textAlign: TextAlign.center)
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiHelper.customText(
                        text: "Special For You",
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                      UiHelper.customText(
                          text: "See All",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey)
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<ProductBloc,ProductState>(builder: (_,state){
                    if(state is ProductLoadingState){
                      return Center(child: CircularProgressIndicator(),);
                    }

                    if(state is ProductErrorsState){
                      return Center(child: Text(state.msg),);
                    }

                    if(state is ProductLoadedState){
                      print(state.products.length);
                      return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product= state.products[index];
                          // List<Color> colors = forYouItems[index]['color'];

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detailspage(
                                        title: product.name!,
                                        price: product.price!,
                                        colors: [],
                                        image: product.image!,

                                      ),
                                    ));
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    border:
                                    Border.all(color: Colors.grey, width: 1)),
                                child: Stack(
                                  children: [Column(
                                    children: [

                                      ClipRRect(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(21),topLeft: Radius.circular(21)),
                                        child: Image.network(
                                          product.image!,
                                          height: 100,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                     /* UiHelper.customText(
                                          text: product.name!,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black
                                      ),*/
                                      Text(
                                        product.name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            UiHelper.customText(
                                                text: product.price!,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                            SizedBox(
                                              height: 16,
                                              width: 60,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 3,
                                                  itemBuilder: (context, colorIndex) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                          child: Container(
                                                            height: 16,
                                                            width: 16,
                                                            decoration: BoxDecoration(
                                                                shape:
                                                                BoxShape.circle,
                                                                border: Border.all(
                                                                    color:Colors.black,
                                                                    width: 1),
                                                                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                                                    ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(21),
                                            bottomLeft: Radius.circular(8)),
                                        color: Colors.deepOrange,
                                      ),
                                      child: Icon(Icons.favorite_border,color: Colors.white,),
                                    ),
                                  ),],

                                ),
                              ),
                            );
                          });
                    }

                   return Container();
                  }),
                 /* GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 21,
                        crossAxisSpacing: 21,
                        crossAxisCount: 2,
                      ),
                      itemCount: forYouItems.length,
                      itemBuilder: (context, index) {
                        List<Color> colors = forYouItems[index]['color'];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailspage(
                                    title: forYouItems[index]['title'],
                                    price: forYouItems[index]['price'],
                                    colors: forYouItems[index]['color'],
                                  ),
                                ));
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: Stack(
                              children: [Column(
                                children: [

                                  ClipRRect(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(21),topLeft: Radius.circular(21)),
                                    child: Image.network(
                                      forYouItems[index]['image'],
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  UiHelper.customText(
                                      text: forYouItems[index]['title'],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        UiHelper.customText(
                                            text: forYouItems[index]['price'],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black),
                                        Container(
                                          height: 16,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: colors.length,
                                              itemBuilder: (context, colorIndex) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Container(
                                                        height: 16,
                                                        width: 16,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color:
                                                                    Colors.grey,
                                                                width: 1),
                                                            color: colors[
                                                                colorIndex]),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(21),
                                        bottomLeft: Radius.circular(8)),
                                    color: Colors.deepOrange,
                                  ),
                                  child: Icon(Icons.favorite_border,color: Colors.white,),
                                ),
                              ),],

                            ),
                          ),
                        );
                      })*/
                ],
              ),
            ),
          ),
        ),
      );}
}

import 'package:e_commerce/repository/widget/ui_helper.dart';
import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  String title;
  String price;
  List colors;
  String image;
  Detailspage({super.key, required this.title,required this.price,required this.colors,required this.image});


  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
        ],
      ),

      body: Stack(
        children:[ Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(widget.image,fit: BoxFit.cover,),

                ),
              ),
              UiHelper.customText(text: widget.title, fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
              SizedBox(
                height: 4,
              ),
              UiHelper.customText(text: widget.price, fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
              SizedBox(
                height: 6,
              ),
              UiHelper.customText(text:'Colors', fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 50,
                      height: 16,

                      decoration: BoxDecoration(
                          color: Color(0xffFF650E),
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.star_border,size: 14,color: Colors.white,),
                          UiHelper.customText(text: "4.8", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    UiHelper.customText(text: "(320 Review)", fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey),

                  ],),
                    UiHelper.customText(text: "Seller: Tariqul Islam", fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),

                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.colors.length,
                    itemBuilder: (context, colorIndex) {
                      return Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 5.0),
                            child: Container(
                              height:26,
                              width: 26,
                              decoration: BoxDecoration(
                                  shape:
                                  BoxShape.circle,
                                  border: Border.all(
                                      color:
                                      Colors.grey,
                                      width: 1),
                                  color: widget.colors[colorIndex]),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 25,

                    decoration: BoxDecoration(
                        color: Color(0xffFF650E),
                        borderRadius: BorderRadius.circular(11)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         UiHelper.customText(text: "Description", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white)
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 25,

                    decoration: BoxDecoration(
                        color: Color(0xffFF650E),
                        borderRadius: BorderRadius.circular(11)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UiHelper.customText(text: "Specifications", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white)
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 25,

                    decoration: BoxDecoration(
                        color: Color(0xffFF650E),
                        borderRadius: BorderRadius.circular(11)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UiHelper.customText(text: "Reviews", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white)
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 11,
              ),
              UiHelper.customText(text: "text", fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey),

            ],
          ),

        ),
          Positioned(
            bottom: 13,
            left: 11,
            right: 11,
            child: Container(
              width: double.infinity,
              height: 55,

              decoration: BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.circular(21)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 35,

                      decoration: BoxDecoration(


                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: Colors.white,width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          UiHelper.customText(text: "-", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
                          UiHelper.customText(text: "1", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
                          UiHelper.customText(text: "+", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 45,

                      decoration: BoxDecoration(
                          color: Color(0xffFF650E),
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          UiHelper.customText(text: "Add to Cart", fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}

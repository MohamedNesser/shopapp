import 'package:ShopApp/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class boardingitem {
  final String image;
  final String title;
  final String body;
  boardingitem({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class firstscreen extends StatefulWidget {
  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  List<boardingitem> boarding = [
    boardingitem(
      image: 'images/shop1.JPG',
      title: 'page title1',
      body: 'page body1',
    ),
    boardingitem(
      image: 'images/shop2.JPG',
      title: 'page title2',
      body: 'page body2',
    ),
    boardingitem(
      image: 'images/shop3.JPG',
      title: 'page title3',
      body: 'page body3',
    ),
  ];
  var PageControler = PageController();
  bool islast=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index){
                   if(index==boarding.length-1){
                     setState(() {
                       islast=true;
                     });
                   }else{
                     setState(() {
                       islast=false;
                     });
                   }
                  },
                  itemBuilder: (context, index) => pagevew(boarding[index]),
                  itemCount: boarding.length,
                  physics: BouncingScrollPhysics(),
                  controller: PageControler,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SmoothPageIndicator(controller: PageControler, count:boarding.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    spacing: 5,
                    dotWidth: 10,
                    expansionFactor: 4,
                    dotColor: Colors.deepOrangeAccent
                  ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      if(islast){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>shoploginscreen()));
                      }
                      PageControler.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    child: Icon(Icons.arrow_forward),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pagevew(boardingitem model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 10,
          ),
          Text(
            "${model.title}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${model.body}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../mapScreens/locationScreen.dart';

class DescScreen extends StatefulWidget {
  Map details;
  DescScreen(this.details);

  @override
  State<DescScreen> createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
  @override
  Widget build(BuildContext context) {

    String background = widget.details['background'] ?? '';
    String title = widget.details['title'] ?? '';
    String Desc = widget.details['desc'] ?? '';
    String Extra = widget.details['extra'] ?? '';

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: widget.details['background'],
              child: Image.asset(
                widget.details['background'],
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.75),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      offset: Offset(3, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(background),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 10,),
              Text(
                Desc,
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 20),
              ),
              SizedBox(height: 20,),
              Text('Services',style: TextStyle(color: Colors.cyanAccent,fontSize: 22,fontWeight: FontWeight.w400),),
              SizedBox(height: 20,),
              Text(Extra,style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Get.to(() => LocationScreen());
                  },
                  child: Text(
                    "Location",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

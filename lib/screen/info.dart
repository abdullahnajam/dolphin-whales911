import 'dart:async';
import 'package:dolphinwhale/screen/home.dart';
import 'package:dolphinwhale/screen/login.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {

  @override
  _infoScreenState createState() => _infoScreenState();
}

class _infoScreenState extends State<Info> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/icon.png', height: 200, width: 200,),

                          Text("Dolphin & Whales 911",style: TextStyle(fontSize: 30,color: Colors.blueGrey,fontWeight: FontWeight.w700),),
                          SizedBox(height: 30,),
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 5),
                            child: Text("This application is developed for the use in the United States including Alaska and Hawaii, as well as Puerto Rico, U.S. Virgin Islands (St. Thomas and St. Croix) and Pacific Island Territories."
                              ,style: TextStyle(color: Colors.blueGrey),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Text("The Development of this application was supported by the U.S. Department of Commerce's National Oceanic and Atmospheric Admission (NOAA) under NOAA Award NA10DAR4170078 to Geo Marine, Inc. and Applied Research Associate, Inc., as well as the Mississippi-Alabama Sea Grant Consortium. The app is maintained/updated by NOAA's National Marine Fisheries Services. The view of expressed herein do not necessarily reflect the views of any of those organizations",
                                style: TextStyle(color: Colors.blueGrey),)
                          ),

                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
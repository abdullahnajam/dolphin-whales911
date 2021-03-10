import 'package:cool_nav/cool_nav.dart';
import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/category.dart';
import 'package:dolphinwhale/screen/photo.dart';
import 'package:dolphinwhale/screen/report.dart';
import 'package:flutter/material.dart';

import 'help.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Is the Mammal still Alive'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blueGrey,

              child: Text('Yes'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => HelpMammal())
                );
              },
            ),
            RaisedButton(
              color: Colors.blueGrey,

              child: Text('No'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => HelpMammal())
                );
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _photo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Send Photo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Have you already reported?'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blueGrey,

              child: Text('Yes'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => Photo())
                );
              },
            ),
            RaisedButton(
              color: Colors.blueGrey,

              child: Text('No'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => Report())
                );
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Dolphin & Whale 911"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image:  AssetImage('assets/Clouds.png',))),
        child: ListView(
          children: <Widget>[
            Container(
              margin:EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Identify a Marine Mammal",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text("Text and Images adapted from Wynne, K. and M. Schwartz. 1999. Guide to marine mammals & turtles of the U.S. Atlantic and Gulf of Mexico, Narragensett, Rhode Island ",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
                  SizedBox(height: 20,),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Category();
                      }));
                    },
                    color: Colors.blueGrey,
                    child: Text("IDENTIFY",style: TextStyle(color: Colors.white),),
                  )


                ],
              ),
            ),
            Container(
              margin:EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Report Injured/Stranded Marine Mammal",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text("Call to report a sick, injured, entangled or dead marine mammal to your local authorized responder.",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
                  SizedBox(height: 20,),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Report();
                      }));
                    },
                    color: Colors.blueGrey,
                    child: Text("REPORT",style: TextStyle(color: Colors.white),),
                  )

                ],
              ),
            ),
            Container(
              margin:EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Help Injured/Stranded Marine Mammal",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text("A list of Do's and Dont's to help out sick, injured, entangled or dead marine mammal.",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
                  SizedBox(height: 20,),
                  RaisedButton(
                    onPressed: () {
                      _showMyDialog();
                    },
                    color: Colors.blueGrey,
                    child: Text("HELP",style: TextStyle(color: Colors.white),),
                  )

                ],
              ),
            ),
            Container(
              margin:EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Send Photo to Respond Network",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text("If you are unable to call/connect, you may take a photo and send it. By sending a photo through this app, you give NOAA Fisheries permission to use the photo for education and outreach and research purposes.",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
                  SizedBox(height: 20,),
                  RaisedButton(
                    onPressed: () {
                      _photo();
                    },
                    color: Colors.blueGrey,
                    child: Text("Send Photo",style: TextStyle(color: Colors.white),),
                  )

                ],
              ),
            ),


          ],
        ),
      ),

      drawer: AppDrawer(),
    );
  }
}

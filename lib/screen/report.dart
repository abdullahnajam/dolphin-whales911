import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/list.dart';
import 'package:dolphinwhale/screen/login.dart';
import 'package:dolphinwhale/screen/photo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Future<void> _loginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign In Required'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You are not currently logged into the app. To use this feature you must sign in',style: TextStyle(fontSize: 14),),
                SizedBox(height: 15,),
                Text('Do you want to sign in?',style: TextStyle(fontSize: 12),)
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blueGrey,

              child: Text('Yes'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => Login())
                );
              },
            ),
            RaisedButton(
              color: Colors.blueGrey,

              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  _checkForLogin() async{
    if (await FirebaseAuth.instance.currentUser() != null) {
      // signed in
      Navigator.pushReplacement(context, new MaterialPageRoute(
          builder: (context) => Photo()));
    } else {
      _loginDialog();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Report"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[

                    SizedBox(height: 5,),
                    Container(
                        margin: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 5,),
                            Text("Question to Expect:",textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Text("- Is the marine animal still alive?",textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Text("- Describe the animal's condition/injury. If entagled, provide a description of attached gear",textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Text("- What is the exact location of the animal? if mobile, take  note of the animal's direction and speed.",textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Text("- What species is the animal? Or describe the animal's size, color, and physical characteristics.",textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Text("- How many animals are there?",textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                          ],
                        )
                    ),

                  ],
                ),
              ),
              Align(
                child: Container(

                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.map,color: Colors.white),
                              SizedBox(height: 10,),
                              Text('   Your Current Location',style: TextStyle(fontSize:15,color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text('Loading',style: TextStyle(color: Colors.white),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.green,
                                child: Text('Call to Report',style: TextStyle(color: Colors.white)),
                                onPressed: (){},
                              ),
                              SizedBox(width: 30,),
                              RaisedButton(
                                color: Colors.green,
                                child: Text('Send Photo',style: TextStyle(color: Colors.white)),
                                onPressed: (){
                                  _checkForLogin();
                                },
                              )
                            ],
                          ),

                        ],
                      ),
                    )
                ),
                alignment: Alignment.bottomCenter,
              )
            ],
          )
      ),
      drawer: AppDrawer(),

    );

  }
}


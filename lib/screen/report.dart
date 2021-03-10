import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/list.dart';
import 'package:dolphinwhale/screen/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {

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
                                  Navigator.push(context, new MaterialPageRoute(
                                      builder: (context) => Photo())
                                  );
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
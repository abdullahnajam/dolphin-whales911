import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/animals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail.dart';
class FishList extends StatefulWidget {
  String id;

  FishList(this.id);

  @override
  _FishListState createState() => _FishListState();
}

class _FishListState extends State<FishList> {
  List<Animals> animalList=[];
  Future<List<Animals>> getCategoryList() async {
    List<Animals> list=new List();
    final databaseReference = FirebaseDatabase.instance.reference();
    await databaseReference.child("mammals").child(widget.id).child("animals").once().then((DataSnapshot dataSnapshot){

      var KEYS= dataSnapshot.value.keys;
      var DATA=dataSnapshot.value;

      for(var individualKey in KEYS){
        Animals category = new Animals(
            individualKey,
            DATA[individualKey]['name'],
          DATA[individualKey]['scientificName'],
          DATA[individualKey]['otherNames'],
          DATA[individualKey]['family'],
          DATA[individualKey]['size'],
          DATA[individualKey]['status'],
          DATA[individualKey]['imgUrl']
        );
        print("key ${category.name}");
        list.add(category);



      }
    });
    animalList=list;
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Most Commonly Seen"),
      ),
      body: FutureBuilder<List<Animals>>(
        future: getCategoryList(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            if(snapshot.data!=null && snapshot.data.length>0){
              return Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: animalList.length,
                      itemBuilder: (BuildContext context,int index){
                        return GestureDetector(
                          child:Card(
                            elevation: 2.0,
                            child: Container(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Image.network(animalList[index].imgUrl,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
                                    SizedBox(height: 10,),
                                    new Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: new Text(animalList[index].name,textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                    ),

                                    SizedBox(height: 10,)
                                  ],
                                )
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) => Detail(animalList[index]))
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    child: Container(
                        color: Colors.blueGrey,
                        height: 105,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Chip(
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.grey.shade800,
                                        child: Text('AB'),
                                      ),
                                      label: Text('Alphabetical'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Chip(
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.grey.shade800,
                                        child: Text('E'),
                                      ),
                                      label: Text('East Coast'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Chip(
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.grey.shade800,
                                        child: Text('W'),
                                      ),
                                      label: Text('West Coast'),
                                    ),
                                  )

                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                      child: Text('PI'),
                                    ),
                                    label: Text('Pacfic Isl.'),
                                  ),
                                  SizedBox(width: 20,),
                                  Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                      child: Text('A'),
                                    ),
                                    label: Text('Alaska'),
                                  ),


                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    alignment: Alignment.bottomCenter,
                  )
                ],
              );
            }
            else {
              return new Center(
                child: Container(
                  child: Text("No Data Found"),
                ),
              );
            }
          }
          else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else {
            return new Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )

    );

  }
}



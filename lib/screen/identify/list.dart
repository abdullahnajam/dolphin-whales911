import 'package:dolphinwhale/screen/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class FishList extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Most Commonly Seen"),
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
                    GestureDetector(
                      child:Card(
                        elevation: 2.0,
                        child: Container(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Image.asset('assets/doli.jpg',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
                                SizedBox(height: 10,),
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: new Text('Dolphin',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                ),

                                SizedBox(height: 10,)
                              ],
                            )
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => Detail())
                        );
                      },
                    ),

                    GestureDetector(
                      child:Card(
                        elevation: 2.0,
                        child: Container(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Image.asset('assets/orca.jpg',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
                                SizedBox(height: 10,),
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: new Text('Orca',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                ),

                                SizedBox(height: 10,)
                              ],
                            )
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => Detail())
                        );
                      },
                    ),

                    GestureDetector(
                      child:Card(
                        elevation: 2.0,
                        child: Container(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Image.asset('assets/doli.jpg',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
                                SizedBox(height: 10,),
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: new Text('Dolphin',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                ),

                                SizedBox(height: 10,)
                              ],
                            )
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => Detail())
                        );
                      },
                    ),

                    GestureDetector(
                      child:Card(
                        elevation: 2.0,
                        child: Container(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Image.asset('assets/orca.jpg',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
                                SizedBox(height: 10,),
                                new Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: new Text('Orca',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                ),

                                SizedBox(height: 10,)
                              ],
                            )
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => Detail())
                        );
                      },
                    ),




                  ],
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
          )
      ),

    );

  }
}
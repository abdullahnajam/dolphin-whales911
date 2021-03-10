import 'package:dolphinwhale/screen/drawer.dart';
import 'package:expandable/expandable.dart';
import 'package:expandable_widget/res/expandable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  FAQPage({Key key}) : super(key: key);


  @override
  _MyFAQPageState createState() => _MyFAQPageState();
}

class _MyFAQPageState extends State<FAQPage> {


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
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: ExpandablePanel(
                        header: Container(
                          margin: EdgeInsets.only(top: 10,left: 10),
                          child: Text("What is a stranding?",style: TextStyle(fontSize: 15),),
                        ),
                        expanded: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text("Marine mammals are sometimes found sick, injured or dead along our beaches or floating in nearshore waters. They can also become entrapped or disoriented and unable to return to their natural habitat"),
                                  margin: EdgeInsets.all(10),
                                ),
                                SizedBox(height: 10,),
                                Image.asset('assets/orca.jpg')
                              ],
                            )
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: ExpandablePanel(
                      header: Container(
                        margin: EdgeInsets.only(top: 10,left: 10),
                        child: Text("Why do marine mammals strand?",style: TextStyle(fontSize: 15),),
                      ),
                      expanded: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("Marine mammals are sometimes found sick, injured or dead along our beaches or floating in nearshore waters. They can also become entrapped or disoriented and unable to return to their natural habitat"),
                                margin: EdgeInsets.all(10),
                              ),
                              SizedBox(height: 10,),
                              Image.asset('assets/orca.jpg')
                            ],
                          )
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: ExpandablePanel(
                      header: Container(
                        margin: EdgeInsets.only(top: 10,left: 10),
                        child: Text("How do marine mammals become entangled?",style: TextStyle(fontSize: 15),),
                      ),
                      expanded: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("Marine mammals are sometimes found sick, injured or dead along our beaches or floating in nearshore waters. They can also become entrapped or disoriented and unable to return to their natural habitat"),
                                margin: EdgeInsets.all(10),
                              ),
                              SizedBox(height: 10,),
                              Image.asset('assets/orca.jpg')
                            ],
                          )
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: ExpandablePanel(
                      header: Container(
                        margin: EdgeInsets.only(top: 10,left: 10),
                        child: Text("What is an authorized responder?",style: TextStyle(fontSize: 15),),
                      ),
                      expanded: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("Marine mammals are sometimes found sick, injured or dead along our beaches or floating in nearshore waters. They can also become entrapped or disoriented and unable to return to their natural habitat"),
                                margin: EdgeInsets.all(10),
                              ),
                              SizedBox(height: 10,),
                              Image.asset('assets/orca.jpg')
                            ],
                          )
                      ),
                    ),
                    color: Colors.white,
                  ),

                ],
              )
            )


          ],
        ),
      ),

      drawer: AppDrawer(),
    );
  }
}

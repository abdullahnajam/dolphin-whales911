import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/model/report_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  final databaseReference = FirebaseDatabase.instance.reference();
  Future<List<ReportModel>> getReport() async {
    List<ReportModel> list=[];
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    await databaseReference.child("reports").once().then((DataSnapshot dataSnapshot){
      var KEYS= dataSnapshot.value.keys;
      var DATA=dataSnapshot.value;

      for(var individualKey in KEYS){
        ReportModel _report = new ReportModel(
          individualKey,
          DATA[individualKey]['lat'],
          DATA[individualKey]['lang'],
          DATA[individualKey]['url'],
          DATA[individualKey]['comment'],
          DATA[individualKey]['contact'],
          DATA[individualKey]['date'],
          DATA[individualKey]['location'],
          DATA[individualKey]['type'],
          DATA[individualKey]['user'],
        );
        if(user.uid==_report.user){
          list.add(_report);
        }

      }

    });
    return list;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("My Reports"),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: FutureBuilder<List<ReportModel>>(
          future: getReport(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data.length > 0) {
                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.network(snapshot.data[index].url,height: 200,fit: BoxFit.cover,),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(snapshot.data[index].comment,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Icon(Icons.category,color: Colors.redAccent,),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Text(snapshot.data[index].type,maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                    )
                                  ],
                                )
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time,color: Colors.grey,),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Text(snapshot.data[index].date,maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                    )
                                  ],
                                )
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Icon(Icons.place,color: Colors.redAccent,),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Text(snapshot.data[index].location,maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                                  )
                                ],
                              )
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
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
        ),
      ),
    );
  }
}

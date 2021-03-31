import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/model/report_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AllReports extends StatefulWidget {


  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports>  with SingleTickerProviderStateMixin{
  TabController _tabController;

  final databaseReference = FirebaseDatabase.instance.reference();


  final TextEditingController _phoneNumberController = TextEditingController();



  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();

  }

  Future<List<ReportModel>> getStrandReports() async {
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
        if(_report.type=='stranding'){
          list.add(_report);
        }

      }

    });
    return list;

  }
  Future<List<ReportModel>> getSightReport() async {
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
        if(_report.type=='sighting'){
          list.add(_report);
        }

      }

    });
    return list;

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("All Reports"),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: TabBar(
                          labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                          indicatorColor: Color(0xff8caec7),
                          indicator: UnderlineTabIndicator(

                            borderSide: BorderSide(width: 4.0,color:Color(0xff8caec7),),
                          ),
                          labelColor: Color(0xff8caec7),
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: 'Stranding'),
                            Tab(text: 'Sighting'),
                          ],
                        ),
                      ),
                      Container( //height of TabBarView
                          height: MediaQuery.of(context).size.height*0.74,

                          child: TabBarView(children: <Widget>[
                            FutureBuilder<List<ReportModel>>(
                              future: getStrandReports(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  if(snapshot.data!=null && snapshot.data.length>0){
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context,int index){
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

                                    );
                                  }
                                  else {
                                    return new Container(
                                      child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('No Reports', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                                            ],
                                          )
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
                            FutureBuilder<List<ReportModel>>(
                              future: getSightReport(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  if(snapshot.data!=null && snapshot.data.length>0){
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context,int index){
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

                                    );
                                  }
                                  else {
                                    return new Container(
                                      child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('No Reports', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                                            ],
                                          )
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

                          ])
                      )

                ])
            ),
          ]),
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 45,
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Colors.green,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Place Bid',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Buy Now',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Center(
                  child: Text(
                    'Place Bid',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // second tab bar view widget
                Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }*/

  /*@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          body: Container(
            height: double.maxFinite,
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 0.2, color: Colors.grey[500]),
                    ),

                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back,color: primaryColor,),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Bookings",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),),
                      )

                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text:"Booking"),
                      Tab(text: "History",),

                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit)
                    ],
                  ),
                )
              ],
            ),
          )
        )
      )
    );
  }*/
}

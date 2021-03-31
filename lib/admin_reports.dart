import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dolphinwhale/screen/model/admin_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:dolphinwhale/screen/drawer.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
class AdminReports extends StatefulWidget {
  @override
  _AdminReportsState createState() => _AdminReportsState();
}

class _AdminReportsState extends State<AdminReports> {

  final databaseReference = FirebaseDatabase.instance.reference();
  Future<List<DetailedReportModel>> getReport() async {
    List<DetailedReportModel> list=[];

    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    await databaseReference.child("detailReports").once().then((DataSnapshot dataSnapshot){
      var KEYS= dataSnapshot.value.keys;
      var DATA=dataSnapshot.value;


      for(var individualKey in KEYS){
        DetailedReportModel _report = new DetailedReportModel(
          individualKey,
          DATA[individualKey]['ageClass'],
          DATA[individualKey]['code'],
          DATA[individualKey]['comment'],
          DATA[individualKey]['dateTime'],
          DATA[individualKey]['frozen'],
          DATA[individualKey]['lang'],
          DATA[individualKey]['lat'],
          DATA[individualKey]['lenght'],
          DATA[individualKey]['location'],
          DATA[individualKey]['personnel'],
          DATA[individualKey]['region'],
          DATA[individualKey]['report'],
          DATA[individualKey]['sex'],
            DATA[individualKey]['species'],
          DATA[individualKey]['url'],
          DATA[individualKey]['user'],
          DATA[individualKey]['weight'],
          DATA[individualKey]['windDirection'],
            DATA[individualKey]['windSpeed']
        );
        if(user.uid==_report.user){
          list.add(_report);
        }

      }

    });
    return list;

  }
  Future<void> _getView(DetailedReportModel _report) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        Completer<GoogleMapController> _controller = Completer();
        Set<Marker> _markers=HashSet<Marker>();
        LatLng location=LatLng(_report.lat, _report.lang);
        _markers.add(Marker(markerId: MarkerId(_report.id),position: location));
        final CameraPosition _kGooglePlex = CameraPosition(
          target: location,
          zoom: 15.4746,
        );
        return Card(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.04,
            right: MediaQuery.of(context).size.width*0.04,
            top: MediaQuery.of(context).size.height*0.1,
            bottom: MediaQuery.of(context).size.height*0.1,
          ),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Detailed Report",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),textAlign: TextAlign.center,),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Report : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.report,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Comment : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.comment,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Code : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.code,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Age Class : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.ageClass,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date & Time : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.dateTime,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Frozen : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.frozen,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lenght : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.lenght,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personnel : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.personnel,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Region : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.region,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sex : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.sex,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Specie : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.species,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wind Speed : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.windSpeed,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wind Direction : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.windDirection,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Weight : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.weight,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text(_report.location,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Map Location : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),

                  ],
                ),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                child: GoogleMap(
                  markers: _markers,
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              )

            ],
          ),
        );
      },
    );
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
        child: FutureBuilder<List<DetailedReportModel>>(
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
                            Image.network(snapshot.data[index].url,height: 150,width: double.maxFinite,fit: BoxFit.cover,),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(snapshot.data[index].report,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            ),
                            SizedBox(height: 10,),

                            Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time,color: Colors.grey,),
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child: Text(snapshot.data[index].dateTime,maxLines: 1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                    )
                                  ],
                                )
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Icon(Icons.place,color: Colors.redAccent,),
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child: Text(snapshot.data[index].location,maxLines: 1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                    )
                                  ],
                                )
                            ),
                            Container(
                                margin: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width*0.8,
                                child: RaisedButton(
                                  onPressed: (){
                                    _getView(snapshot.data[index]);
                                  },
                                  color: Color(0xff8caec7),
                                  child: Text("View",style: TextStyle(color: Colors.white),),
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

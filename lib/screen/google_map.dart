import 'dart:async';
import 'dart:collection';

import 'package:dolphinwhale/screen/model/report_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'drawer.dart';

class MapSample extends StatefulWidget {
  double lattitude,longitude;

  MapSample(this.lattitude, this.longitude);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  double lat=37.42796133580664,lang=-122.085749655962;
  Set<Marker> _markers=HashSet<Marker>();

  setMarker(LatLng location,String id,String title,String type){
    _markers.add(
      Marker(markerId: MarkerId(id),position: location,infoWindow: InfoWindow(
        title: title,
        snippet: type,
      ),)
    );
  }
  bool isMarkerChecked=false;

  final databaseReference = FirebaseDatabase.instance.reference();
  getMarker() async {
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
    print("here");
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
          setState(() {
            LatLng location=LatLng(_report.lat, _report.lang);
            setMarker(location, _report.id,_report.comment,_report.type);
          });
        }

      }

    });
    setState(() {
      isMarkerChecked=true;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarker();
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.lattitude, widget.longitude),
      zoom: 15.4746,
    );
  }
  CameraPosition _kGooglePlex;




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor:  const Color(0xff8caec7),
          title: new Text("Map"),
        ),
        drawer: AppDrawer(),
      body: SafeArea(
        child: isMarkerChecked?_markers.length>0?GoogleMap(
          markers: _markers,
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ):Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff8caec7),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text("No Reports",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
              ),
            )
          ],
        ):Center(child: CircularProgressIndicator(),)

      )

    );
  }




}
import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/animals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  Animals _animals;
  @override
  _DetailState createState() => _DetailState();

  Detail(this._animals);
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Overview"),
      ),
      body: SafeArea(

          child:  ListView(
            children: <Widget>[
              new Image.network(widget._animals.imgUrl,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
              SizedBox(height: 10,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Text(widget._animals.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                      Text(widget._animals.scientificName,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Other Names",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      Text(widget._animals.otherNames,textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Family",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      Text(widget._animals.family,textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Status",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      Text(widget._animals.status,textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Size",textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      Text(widget._animals.size,textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
              ),


            ],
          )
      ),

    );

  }
}



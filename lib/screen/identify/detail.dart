import 'package:dolphinwhale/screen/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

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
              new Image.asset('assets/doli.jpg',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 200,),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text("Harbor Seal",textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                    Text("Phoca Vitulina",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
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
                    Text("Common seal, hair seal",textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
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
                      Text("Phocidae",textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
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
                      Text("Protected",textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
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
                      Text("Adults to 1.7 - 1.9 m (5.6 - 6.3 ft), 120 kg; males slightly larger than females. At birth, pups are approx. 0.7 m (30 in ), 10 kg",textAlign: TextAlign.left,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
              ),


            ],
          )
      ),

    );

  }
}
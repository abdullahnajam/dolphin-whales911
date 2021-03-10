import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photo extends StatefulWidget {
  Photo({Key key}) : super(key: key);


  @override
  _MyFAQPageState createState() => _MyFAQPageState();
}

class _MyFAQPageState extends State<Photo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Send Photo'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Location',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 10,),
            Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Take a photo',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: (){
              },
              child: Container(
                width: 100,
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.25,left: MediaQuery.of(context).size.width*.25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(196, 135, 198, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ]
                ),
                child: ListTile(
                  title: Text('Upload From Device',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('OR',textAlign: TextAlign.center,style: TextStyle(fontSize:18,fontWeight:FontWeight.w400),),
            SizedBox(height: 20,),
            Column(
              children: <Widget>[
                Image.asset('assets/camera.png',width: 50,height: 50,color:Colors.blueGrey,),
                SizedBox(height: 3,),
                Text('Click Here',textAlign: TextAlign.center,style: TextStyle(fontSize:12,fontWeight:FontWeight.w400),),
              ],
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
              },
              child: Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(196, 135, 198, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ]
                ),
                child: ListTile(
                  title: Text('Submit',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

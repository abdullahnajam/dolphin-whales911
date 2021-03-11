import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/list.dart';
import 'package:dolphinwhale/screen/model/mammal_category.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final databaseReference = FirebaseDatabase.instance.reference();


  Future<List<MammalCategory>> getCategoryList() async {
    List<MammalCategory> list=new List();
    print("here");
    await databaseReference.child("mammals").once().then((DataSnapshot dataSnapshot){
      var KEYS= dataSnapshot.value.keys;
      var DATA=dataSnapshot.value;

      for(var individualKey in KEYS){
        MammalCategory category = new MammalCategory(
            individualKey,
            DATA[individualKey]['name']
        );
        print("key ${category.id}");
        list.add(category);

      }

    });
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Identify"),
      ),
      body: SafeArea(
          child: FutureBuilder<List<MammalCategory>>(
            future: getCategoryList(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                if(snapshot.data!=null && snapshot.data.length>0){
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context,int index){
                      return GestureDetector(
                        child: Card(
                          child: ListTile(
                            leading: FlutterLogo(),
                            title: Text(snapshot.data[index].name),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => FishList(snapshot.data[index].id))
                          );
                        },
                      );
                    },
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
      ),
      drawer: AppDrawer(),

    );

  }
}

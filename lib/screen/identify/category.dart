import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/identify/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Identify"),
      ),
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('Dolphins and Porpoises'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => FishList())
                  );
                },
              ),

              GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('Whales'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => FishList())
                  );
                },
              ),

              GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('Manatees'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => FishList())
                  );
                },
              ),

              GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('Seals and Sea Lions'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => FishList())
                  );
                },
              ),







            ],
          )
      ),
      drawer: AppDrawer(),

    );

  }
}
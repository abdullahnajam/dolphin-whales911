import 'package:dolphinwhale/alert/helpAlert.dart';
import 'package:dolphinwhale/screen/FAQs.dart';
import 'package:dolphinwhale/screen/help.dart';
import 'package:dolphinwhale/screen/home.dart';
import 'package:dolphinwhale/screen/identify/category.dart';
import 'package:dolphinwhale/screen/photo.dart';
import 'package:dolphinwhale/screen/profileUser.dart';
import 'package:dolphinwhale/screen/report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'info.dart';
import 'login.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) => Login())
        );
      } catch (e) {
        print(e); // TODO: show dialog with error
      }
    }
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Is the Mammal still Alive'),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.blueGrey,

                child: Text('Yes'),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => HelpMammal())
                  );
                },
              ),
              RaisedButton(
                color: Colors.blueGrey,

                child: Text('No'),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => HelpMammal())
                  );
                },
              ),
            ],
          );
        },
      );
    }
    Future<void> _photo() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Send Photo'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Have you already reported?'),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.blueGrey,

                child: Text('Yes'),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => Photo())
                  );
                },
              ),
              RaisedButton(
                color: Colors.blueGrey,

                child: Text('No'),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => Report())
                  );
                },
              ),
            ],
          );
        },
      );
    }
    return Drawer(
      child: SafeArea(child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.home,text: 'Home',onTap: () => Navigator.push(context, new MaterialPageRoute(
              builder: (context) => HomePage())
          )),
          _createDrawerItem(icon: Icons.assignment_ind,text: 'Identify',onTap: () => Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Category())
          )),
          _createDrawerItem(icon: Icons.call, text: 'Help',onTap: () => {_showMyDialog()}),
          _createDrawerItem(icon: Icons.error_outline,text: 'Report',onTap: () => Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Report())
          )),
          _createDrawerItem(icon: Icons.person,text: 'Profile',onTap: () => Navigator.push(context, new MaterialPageRoute(
              builder: (context) => profileUser())
          )),
          _createDrawerItem(icon: Icons.image,text: 'Photo',onTap: () => {_photo()}),

          Divider(color: Colors.grey,),
          _createDrawerItem(icon: Icons.question_answer,text: 'FAQs',onTap: () => Navigator.push(context, new MaterialPageRoute(
              builder: (context) => FAQPage())
          )),
          _createDrawerItem(icon: Icons.info,text: 'Info',onTap: () => Navigator.push(context, new MaterialPageRoute(
              builder: (context) => Info())
          )),
          _createDrawerItem(icon: Icons.exit_to_app,text: 'Logout',onTap: () => _signOut()),
          ListTile(
            title: Text('0.0.2'),
            onTap: () {},
          ),
        ],
      )),
    );
  }
  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
            image: DecorationImage(
                fit: BoxFit.contain,
                image:  AssetImage('assets/icon.png',))),
        );
  }
  Widget _createStaticDrawerItem({IconData icon, String text}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),

    );
  }
}
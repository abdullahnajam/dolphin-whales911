import 'package:dolphinwhale/screen/drawer.dart';
import 'package:expandable/expandable.dart';
import 'package:expandable_widget/res/expandable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpMammal extends StatefulWidget {
  HelpMammal({Key key}) : super(key: key);


  @override
  _MyHelpPageState createState() => _MyHelpPageState();
}

class _MyHelpPageState extends State<HelpMammal> {

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
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.check),text: "DO's",),
                Tab(icon: Icon(Icons.clear),text: "DONT's"),
              ],
            ),
            title: Text('Help'),
            backgroundColor: Colors.blueGrey,
          ),
          body: TabBarView(
            children: [
              ListView(
                children: <Widget>[

                  Card(
                    child: ListTile(
                      title: Text('Immediately REPORT the dead marine animal to your local authorized responder'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Keep children and pets away from dead marine animal'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('minimize contact with the animal as it can carry disease'),
                    ),
                  ),
                ],
              ),
              ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      title: Text('Push the animal back to sea'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Collect any parts from dead animal as it is illegal'),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



}

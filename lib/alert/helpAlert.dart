import 'package:dolphinwhale/screen/help.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkPhoto extends StatefulWidget {
  static const String routeName = "/map";
  @override
  DpState createState() => DpState();
}

class DpState extends State<DarkPhoto> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> scaleAnimation;



  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }



  @override
  Widget build(BuildContext context) {



    return Container(
      margin: EdgeInsets.only(top: 50,bottom: 50,left: 20,right: 20),
      child: Material(
        color: Colors.grey[800],
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.of(context, rootNavigator: true).pop();
                  showDialog(context: context, child:
                  new HelpMammal(),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10,left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffff0000),
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
      ),
    );
  }
}
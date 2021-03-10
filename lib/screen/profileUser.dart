import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileUser extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[

                  Container(
                    width: double.infinity,
                    height: 220.0,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Center(
                      child: Container(
                        height: 150.0,
                        width: 310.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.black12.withOpacity(0.1)),
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "username",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "user-email@mail.com",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16.0),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 25.0, top: 40.0, bottom: 10.0),
                child: Text(
                  "Click to Explore",
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
              ),
              _card(Icons.error_outline, "My Reports"),
              _card(Icons.vpn_key, "Change Password"),
              _card(Icons.exit_to_app, "Logout"),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// Card for crypto list
  ///
  Widget _card(IconData _icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0, top: 0.0),
              child: Container(
                height: 55.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(70.0)),
                    color: Colors.white),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontWeight: FontWeight.w400,
                            fontSize: 15.5,color: Colors.black),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 55.0,
                  width: 55.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.repeated,
                        colors: [
                          Colors.blueGrey,
                          Colors.blueGrey.withOpacity(0.7)
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Center(
                    child: Icon(
                      _icon,
                      color: Colors.white,
                      size: 26.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}



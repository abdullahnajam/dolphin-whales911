import 'package:dolphinwhale/animation/FadeAnimation.dart';
import 'package:dolphinwhale/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import './auth.dart';
import 'login.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Future<void> _showMyDialog(String e) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Error'),
                Text(e),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blueGrey,
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String username = '';
  String age = '';
  String phoneNumber = '';
  FocusNode myFocusNode = new FocusNode();
  String password = '';
  bool visible=false;
  @override
  Widget build(BuildContext context) {

    final ProgressDialog pr=ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:Colors.blueGrey,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Register", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Join Us!", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    FadeAnimation(1.4, Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                          )]
                      ),
                      child: Column(
                        children: <Widget>[

                          Container(
                            height: 60,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                              validator: (val) => val.isEmpty ? 'Enter an username' : null,
                              onChanged: (val) {
                                setState(() => username = val.trim());
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val.trim());
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                              validator: (val) => val.isEmpty ? 'Enter phone number' : null,
                              onChanged: (val) {
                                setState(() => phoneNumber = val.trim());
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Age",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                              validator: (val) => val.isEmpty ? 'Enter an age' : null,
                              onChanged: (val) {
                                setState(() => age = val.trim());
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                              obscureText: true,
                              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                          ),





                        ],
                      ),
                    )),
                    SizedBox(height: 70,),
                    FadeAnimation(1.5, GestureDetector(
                      child: Text("Already Have An Account?", style: TextStyle(color: Colors.grey),),
                      onTap: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: Login()));
                      },
                    )),
                    SizedBox(height: 20,),
                    FadeAnimation(1.6,
                        GestureDetector(
                          onTap: ()async {
                            setState(() {
                              visible=true;
                            });
                            if(_formKey.currentState.validate()){
                              await pr.show();
                              final databaseReference = FirebaseDatabase.instance.reference();
                              dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                              if(result != null) {
                                //FirebaseUser user=await FirebaseAuth.instance.currentUser();
                                databaseReference.child("users").child(result.uid).set({
                                  'name': username,
                                  'description': 'No Description',
                                  'email': email,
                                  'password': password,
                                  'age': age,
                                  'token': 'token',
                                  'phoneNumber': phoneNumber,
                                  'role': 'user',

                                });
                                pr.hide();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));

                              }
                              else
                              {
                                Toast.show("Error : Cannot Register", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                                setState(() {
                                  visible=false;
                                  error = 'Error : Cannot Register';
                                });
                                pr.hide();
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blueGrey
                            ),
                            child: Center(
                              child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
                    ),

                    //Text(error, style: TextStyle(color: Colors.red),),
                    SizedBox(height: 20,),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
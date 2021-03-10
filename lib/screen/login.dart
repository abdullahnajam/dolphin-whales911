
import 'package:dolphinwhale/animation/FadeAnimation.dart';
import 'package:dolphinwhale/screen/home.dart';
import 'package:dolphinwhale/screen/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
class Login extends StatefulWidget {

  final Function toggleView;
  Login({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  FocusNode myFocusNode = new FocusNode();


  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    bool visible=false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blueGrey,
                  Colors.blueGrey
                ]
            )
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1, Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)),
                    SizedBox(height: 10,),
                    FadeAnimation(1.3, Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
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
                              padding: EdgeInsets.all(10),
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
                      )
                      ),
                      SizedBox(height: 50,),
                      FadeAnimation(
                          1.5,
                          Column(
                            children: <Widget>[

                              SizedBox(height: 20,),
                              GestureDetector(
                                child: Text("Don't Have An Account?", style: TextStyle(color: Colors.grey),),
                                onTap: (){
                                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: Register()));
                                },
                              ),

                            ],
                          )
                      ),
                      SizedBox(height: 20,),
                      FadeAnimation(1.6,
                          GestureDetector(
                            onTap: ()async {
                              visible=true;
                              if(_formKey.currentState.validate()){
                                dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                if(result == null) {
                                  setState(() {
                                    visible=false;
                                    error = 'Could not sign in with those credentials';
                                  });
                                }
                                else
                                {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
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
                                child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 20,),
                      Text(error, style: TextStyle(color: Colors.red),),
                      SizedBox(height: 20,),
                      Visibility(
                        child: CircularProgressIndicator(),
                        visible: visible,
                      ),


                      /*SizedBox(height: 40,),

                    SizedBox(height: 40,),

                    SizedBox(height: 20,),*/



                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
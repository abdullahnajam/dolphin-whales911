import 'package:dolphinwhale/editProfile.dart';
import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/login.dart';
import 'package:dolphinwhale/screen/model/user_data.dart';
import 'package:dolphinwhale/screen/user_view_reports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:dolphinwhale/all_report.dart';
import 'package:dolphinwhale/admin_reports.dart';

class profileUser extends StatefulWidget {
  @override
  _profileUserState createState() => _profileUserState();
}

class _profileUserState extends State<profileUser> {
  _checkForLogin() async{
    if (await FirebaseAuth.instance.currentUser() != null) {
      // signed in
      setState(() {
        isLoggedInStatus=true;
      });
    } else {
      setState(() {
        isLoggedInStatus=false;
      });

    }
    setState(() {
      isLoggedInChecked=true;
    });
  }
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, new MaterialPageRoute(
          builder: (context) => Login()));
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  @override
  void initState() {
    super.initState();
    _checkForLogin();
  }
  final _formKey = GlobalKey<FormState>();
  bool isLoggedInStatus=false;
  bool isLoggedInChecked=false;

  final databaseReference = FirebaseDatabase.instance.reference();

  FirebaseUser user;
  Future<UserData> getUser() async {
    user=await FirebaseAuth.instance.currentUser();
    print("here");
    UserData userData;
    await databaseReference.child("users").child(user.uid).once().then((DataSnapshot dataSnapshot){
      var KEYS= dataSnapshot.key;
      var DATA=dataSnapshot.value;

       userData = new UserData(
          KEYS,
          DATA['name'],
          DATA['email'],
          DATA['password'],
          DATA['age'],
          DATA['role'],
          DATA['phoneNumber'],
          DATA['description'],
          DATA['token']
      );
    });
    print("user ${userData.username}");
    return userData;
  }
  final ageController=TextEditingController();
  final nameController=TextEditingController();
  final desController=TextEditingController();
  final phoneController=TextEditingController();
  Future<void> _editProfile(UserData user) async {
    ageController.text=user.age;
    nameController.text=user.username;
    phoneController.text=user.phoneNumber;
    desController.text=user.description;
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Card(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.04,
              right: MediaQuery.of(context).size.width*0.04,
              top: MediaQuery.of(context).size.height*0.18,
              bottom: MediaQuery.of(context).size.height*0.18,
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),textAlign: TextAlign.center,),
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]),
                          top: BorderSide(color: Colors.grey[300]),
                          left: BorderSide(color: Colors.grey[300]),
                          right: BorderSide(color: Colors.grey[300]),

                        )
                    ),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]),
                          top: BorderSide(color: Colors.grey[300]),
                          left: BorderSide(color: Colors.grey[300]),
                          right: BorderSide(color: Colors.grey[300]),

                        )
                    ),
                    child: TextFormField(
                      maxLines: 3,
                      minLines: 3,
                      controller: desController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]),
                          top: BorderSide(color: Colors.grey[300]),
                          left: BorderSide(color: Colors.grey[300]),
                          right: BorderSide(color: Colors.grey[300]),

                        )
                    ),
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Age",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]),
                          top: BorderSide(color: Colors.grey[300]),
                          left: BorderSide(color: Colors.grey[300]),
                          right: BorderSide(color: Colors.grey[300]),

                        )
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                      onPressed: ()async{

                        if (_formKey.currentState.validate()) {
                          FirebaseUser userForUpdate=await FirebaseAuth.instance.currentUser();
                          databaseReference.child('users').child(userForUpdate.uid).update({
                            'name': nameController.text,
                            'phoneNumber': phoneController.text,
                            'description': desController.text,
                            'age': ageController.text,
                          }).then((value) {
                            Toast.show("Updated", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                            Navigator.pop(context);
                          });
                        }
                      },
                      color: Color(0xff8caec7),
                      child: Text("Update Profile",style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor:  const Color(0xff8caec7),
          title: new Text("Profile"),
        ),
        drawer: AppDrawer(),
      body: SafeArea(
        child: isLoggedInChecked?
            isLoggedInStatus?
                FutureBuilder<UserData>(
                  future: getUser(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      if(snapshot.data!=null){
                        //print(snapshot.data.username);
                        return Container(
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
                                                snapshot.data.username,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Sofia",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20.0),
                                              ),
                                              SizedBox(height: 20,),
                                              Text(
                                                snapshot.data.email,
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
                                snapshot.data.role=='admin'?
                                _card(Icons.error_outline, "All Reports", () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AllReports()));})
                                :Container(),
                                _card(Icons.error, "My Reports", () {
                                  if(snapshot.data.role=='admin'){

                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AdminReports()));
                                  }
                                  else
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Reports()));
                                }),
                                _card(Icons.edit, "Edit Profile", () {_editProfile(snapshot.data);}),
                                //_card(Icons.vpn_key, "Change Password", () {print("change password");}),
                                _card(Icons.exit_to_app, "Logout", () {_signOut();}),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          ),
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
                :
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/nouser.png"),
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: RaisedButton(
                      color: Colors.blueGrey,
                      child: Text('Sign In',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        Navigator.pushReplacement(context, new MaterialPageRoute(
                            builder: (context) => Login())
                        );
                      },
                    ),
                  )
                ],
            )
            :
        CircularProgressIndicator()
      )
    );
  }
  Widget _card(IconData _icon, String title, GestureTapCallback onTap) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: InkWell(
          onTap: onTap,
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
                              fontWeight: FontWeight.w300,
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
                      color:Colors.blueGrey,
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




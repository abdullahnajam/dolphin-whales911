import 'package:dolphinwhale/screen/drawer.dart';
import 'package:dolphinwhale/screen/model/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class EditProfile extends StatefulWidget {
  UserData _userData;

  EditProfile(this._userData);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ageController=TextEditingController();
  final nameController=TextEditingController();
  final desController=TextEditingController();
  final phoneController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor:  const Color(0xff8caec7),
        title: new Text("Edit Profile"),
      ),
      drawer: AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: Border(
                        bottom: BorderSide(color: Colors.grey[400]),
                        top: BorderSide(color: Colors.grey[400]),
                      left: BorderSide(color: Colors.grey[400]),
                      right: BorderSide(color: Colors.grey[400]),

                    )
                ),
                child: TextFormField(
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
            ],
          ),
        )
      ),
    );
  }
}

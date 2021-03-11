import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Photo extends StatefulWidget {
  Photo({Key key}) : super(key: key);


  @override
  _MyFAQPageState createState() => _MyFAQPageState();
}

class _MyFAQPageState extends State<Photo> {
  Position _currentPosition;
  String _currentAddress;
  String imageUrl;
  String startDate = formatDate(DateTime.now(), [dd, '-', mm, '-', yyyy]);

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  getCurrentLocation() {
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }
  String dropdownValue = 'Email';
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress = "${place.subLocality}, ${place.locality}, ${place.country}";
        if(_currentAddress==null){
          Toast.show("Please turn on gps", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
        }
        print("loc $_currentAddress");
        locationController.text=_currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  File _imageFile;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
    uploadImageToFirebase(context);
  }
  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
    uploadImageToFirebase(context);
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = _imageFile.path;
    StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => imageUrl=value,
    );
  }

  final locationController=TextEditingController();
  final commentController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    print("a $_currentAddress");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Send Photo'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Location',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 10,),
            Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Date',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 10,),
            FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7),
                      onChanged: (date) {
                        print('change $date');
                      },
                      onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          startDate = formatDate(
                              date, [dd, '-', mm, '-', yyyy]);
                        });
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en);
                },
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 18, color: Colors
                        .black,),
                    SizedBox(width: 20,),
                    Text(
                      startDate,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
            ),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Contact Method',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 10,),
            Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded:true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(fontSize:16,color: Colors.black),
                    underline: Container(
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Email', 'Phone']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Comments',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 10,),
            Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 4,
                    controller: commentController,
                    decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 10),
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Take a photo',textAlign: TextAlign.left,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),),
                )
            ),
            SizedBox(height: 20,),
            _imageFile==null?
                Column(
                  children: [


                    InkWell(
                      onTap: pickImageFromGallery,
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.25,left: MediaQuery.of(context).size.width*.25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blueGrey,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]
                        ),
                        child: ListTile(
                          title: Text('Upload From Device',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('OR',textAlign: TextAlign.center,style: TextStyle(fontSize:18,fontWeight:FontWeight.w400),),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: pickImage,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/camera.png',width: 50,height: 50,color:Colors.blueGrey,),
                          SizedBox(height: 3,),
                          Text('Click Here',textAlign: TextAlign.center,style: TextStyle(fontSize:12,fontWeight:FontWeight.w400),),
                        ],
                      ),
                    ),
                  ],
                ):
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(_imageFile,width: 200,height: 200,fit: BoxFit.cover,),
                  ),
                  margin: EdgeInsets.only(left: 20,right: 20),
                ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                if(locationController.text=="" || commentController=="" || imageUrl==null){
                  Toast.show("Please fill all the required details", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                }
                else{
                  final databaseReference = FirebaseDatabase.instance.reference();
                  databaseReference.child("reports").set({
                    'location': locationController.text,
                    'comment': commentController.text,
                    'contact': dropdownValue,
                    'date': startDate,
                    'url': imageUrl,
                    'type': 'stranding'

                  });
                  Toast.show("Submitted", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                }

              },
              child: Container(
                margin: EdgeInsets.only(right: 10,left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
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
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

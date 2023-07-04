import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class Feedback_Screen extends StatefulWidget {
  const Feedback_Screen({Key? key}) : super(key: key);

  @override
  State<Feedback_Screen> createState() => _Feedback_ScreenState();
}

class _Feedback_ScreenState extends State<Feedback_Screen> {
  TextEditingController _fdnameController = TextEditingController();
  TextEditingController _reviewController = TextEditingController();

  sendDataFirestore(name,review) async {
    //FirebaseStorage _storage = FirebaseStorage.instance;

    await FirebaseFirestore.instance
        .collection('review')
        .doc()
        .set({'name': _fdnameController.text.trim(), 'review': _reviewController.text.trim()});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:SingleChildScrollView(
        child: Container(
          color: Colors.amberAccent,
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Review', style: AppText20Style(colorDarkBlue)),
              SizedBox(
                height: 1,
              ),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
    children:
    [Icon(Icons.star,color: Colors.yellowAccent),
    Icon(Icons.star,color: Colors.yellowAccent,),
    Icon(Icons.star,color: Colors.yellowAccent,),
    Icon(Icons.star,color: Colors.yellowAccent,),
    Icon(Icons.star,color: Colors.yellowAccent,)
    ]
),
  SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _fdnameController,
                decoration: AppInputDecoration("Name"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _reviewController,
                decoration: AppInputDecoration("Write Something......"),
                maxLines: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed: () {
                      sendDataFirestore(_fdnameController,_reviewController);
                    },
                    child: SuccessButtonChild('Send')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

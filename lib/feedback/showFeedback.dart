import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodshopapp/style/style.dart';

class Show_Feedback extends StatefulWidget {
  const Show_Feedback({Key? key}) : super(key: key);

  @override
  State<Show_Feedback> createState() => _Show_FeedbackState();
}
//FirebaseFirestore.instance.collection('review').snapshots()
class _Show_FeedbackState extends State<Show_Feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('review').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.size,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(snapshot.data!.docs[index]['name'],style: AppText16Style(Colors.green),),
                  subtitle: Text(snapshot.data!.docs[index]['review'],style: AppText16Style(Colors.black),maxLines: 10,),
                trailing: Icon(Icons.favorite_outlined,color: colorRed,),
                ),
              );
            },
          );
        },
      ),),
    );
  }}
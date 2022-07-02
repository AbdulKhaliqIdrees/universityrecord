import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentItem extends StatelessWidget {
  const StudentItem(this.x, {Key? key}) : super(key: key);
  final QueryDocumentSnapshot x;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                x["Name"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                x["RollNo"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                x["degreeperiod"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                x["section"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            FirebaseFirestore.instance.collection('Class').doc(x.id).delete();
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}

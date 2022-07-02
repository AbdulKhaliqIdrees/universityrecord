import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:universityrecord/screens/student_item.dart';
import 'package:universityrecord/widgets/textfield_widget.dart';

class ApBar extends StatefulWidget {
  const ApBar({Key? key}) : super(key: key);

  @override
  State<ApBar> createState() => _ApBarState();
}

class _ApBarState extends State<ApBar> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController section = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  Create() async {
    try {
      await firestore.collection("Class").doc(rollno.text).set({
        "Name": name.text,
        "RollNo": rollno.text,
        "degreeperiod": degree.text,
        "section": section.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      await firestore.collection("Class").doc(rollno.text).update({
        "Name": name.text,
        "RollNo": rollno.text,
        "degreeperiod": degree.text,
        "section": section.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      await firestore.collection("Class").doc(rollno.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("University Record"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            children: [
              Textfield(name, "Name"),
              Textfield(rollno, "RollNo"),
              Textfield(degree, "Degree"),
              Textfield(section, "Section"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Create();
                      name.clear();
                      rollno.clear();
                      degree.clear();
                      section.clear();
                    },
                    color: Colors.red,
                    child: const Text("Create"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      update();
                      name.clear();
                      rollno.clear();
                      degree.clear();
                      section.clear();
                    },
                    color: Colors.yellow,
                    child: const Text("Update"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      delete();
                      name.clear();
                      rollno.clear();
                      degree.clear();
                      section.clear();
                    },
                    color: Colors.orange,
                    child: const Text("Delete"),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Class")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                QueryDocumentSnapshot x =
                                    snapshot.data!.docs[index];
                                return StudentItem(x);
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}

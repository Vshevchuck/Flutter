import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void initFireBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void initState() {
    super.initState();
    initFireBase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Center(
                  child: Column(children: [
                    Text('Firebase connected'),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('items')
                              .add({'elements': 'element'});
                        },
                        child: Text("Add")),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('items')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) return Text("No elements");
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {

                              return Text(snapshot.data!.docs[index].get('elements'));
                            },);
                        }),
                  ]))),
        ));
  }
}

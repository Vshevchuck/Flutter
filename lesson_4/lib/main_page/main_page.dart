import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email']
);

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GoogleSignInAccount? _currentUser;

  void initFireBase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState((){
        _currentUser = account;
      });
    });
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
                              .add({'elements': 'element', 'titles': 'title'});
                        },
                        child: Text("Add")),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('items')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          return ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('items').doc(snapshot.data!
                                  .docs[snapshot.data!.docs
                                  .length - 1].id).delete();
                            },
                            child: Text("DellLast"),);
                        }),
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
                              final elements = snapshot.data!.docs[index].get(
                                  'elements');
                              final title = snapshot.data!.docs[index].get(
                                  'titles');
                              return Column(
                                children: [
                                  Text('$title-$index'),
                                  Text('$elements'),
                                ],
                              );
                            },);
                        }),
                  ]))),
        ));
  }
}

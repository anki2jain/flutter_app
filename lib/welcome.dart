import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'service/crud.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  WelcomeState createState() {
    return new WelcomeState();
  }
}

class WelcomeState extends State<Welcome> {
  Crud crudObj = new Crud();
  String name;
  String standard;
  Map<String, String> data = {};
  Future<void> dialogTrigger(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            content: new Text("Congrats", style: TextStyle(color: Colors.red)),
            actions: <Widget>[
              FlatButton(
                child: new Text("alright"),
                onPressed: Navigator.of(context).pop,
              )
            ],
          );
        });
  }

  Widget _display() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('subject').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(
                    document['name'],
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: new Text(
                    document['standard'],
                    style: TextStyle(color: Colors.black),
                  ),
                  
                );
                
              }).toList(),
            );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var user;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(" ${widget.user.email}"),
      ),
      body: _display(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          // onPressed: ,
          onPressed: () {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) => new AlertDialog(
                      title: new Text("Dialog Title"),
                      content: Container(
                          width: 250.0,
                          height: 250.0,
                          child: new Column(
                            children: <Widget>[
                              TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  //  onSaved: (input){
                                  //   name = input;
                                  // },
                                  onChanged: (value) {
                                    this.name = value;
                                  },
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: 'name',
                                  )),
                              TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  // onSaved: (input){
                                  //   standard = input;
                                  // },

                                  onChanged: (value) {
                                    this.standard = value;
                                  },
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: 'class',
                                  )),
                            ],
                          )),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Add"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Map<String, dynamic> data = <String, dynamic>{
                              'name': name,
                              'standard': this.standard
                            };
                            crudObj.addData(data).then((result) {
                              dialogTrigger(context);
                            }).catchError((e) {
                              print(e);
                              // Navigator.of(context).pushNamed('.');
                            });
                          },
                        ),
                      ],
                    ));
          }),
    );
  }
}

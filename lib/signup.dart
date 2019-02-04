import 'package:flutter/material.dart';
import 'package:login/login.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final firmname = Padding(
    padding: EdgeInsets.only(top: 100.0, left: 70.0),
    child: new Text("TECHSHIKSHA",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Color(0xFF606687))),
  );
  final ankit = Padding(
    padding: EdgeInsets.all(8.0),
    child: const Card(child: Text('Hello World!')),
  );
  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: new Image.asset('assets/user.png', height: 60.0, width: 50),
      // child: Image.asset('/logo.png'),
    ),
  );

  final email = TextField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    cursorColor: Color(0xFF606687),
    // initialValue: 'hehed@gmail.com',
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.email,
        color: Color(0xFF606687),
      ),
      hintText: 'Email',
      hintStyle: TextStyle(fontSize: 20.0, color: Color(0xFF606687)),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF606687), width: 2.0),
      ),
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white, width: 5.0) ),
    ),
  );

  final password = TextField(
    autofocus: false,
    // cursorColor: Color(0xFF606687),
    // initialValue: 'some password',
    obscureText: true,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.lock,
        color: Color(0xFF606687),
      ),
      // icon:Icon(Icons.verified_user),
      hintText: 'Password',
      hintStyle: TextStyle(fontSize: 20.0, color: Color(0xFF606687)),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF606687), width: 2.0),
      ),
    ),
  );

  final confirmpassword = TextField(
    autofocus: false,
    cursorColor: Color(0xFF606687),
    // initialValue: 'some password',
    obscureText: true,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.lock,
        color: Color(0xFF606687),
      ),
      // icon:Icon(Icons.verified_user),
      hintText: 'Confirm Password',
      hintStyle: TextStyle(fontSize: 20.0, color: Color(0xFF606687)),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF606687), width: 2.0),
      ),
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );
  final username = TextFormField(
    autofocus: false,
    // initialValue: 'some password',
    // obscureText: true,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.person_outline,
        color: Color(0xFF606687),
      ),
      // icon:Icon(Icons.verified_user),
      hintText: 'Username',
      hintStyle: TextStyle(fontSize: 20.0, color: Color(0xFF606687)),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF606687), width: 2.0),
      ),
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );
  final loginButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        //Navigator.of().pushNamed();
      },
      padding: EdgeInsets.all(12),
      color: Colors.green,
      child: Text('Sign In', style: TextStyle(color: Colors.white))
    ,
    ),
  );
  Widget ctext(){
return  Padding(
     padding: EdgeInsets.symmetric(vertical: 16.0),

     child: new FlatButton(
       child: new Text("Already a member! Log In"),
       onPressed: () {
         
  //      Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) =>Login()),
  // );
       },
     ),
   );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text("login page"),
      // ),
      // drawer: new Drawer(
      //   child: new Text(" hiii"),
      // ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          firmname,
          logo,
          SizedBox(height: 24.0),
          username,
          SizedBox(height: 8.0),
          email,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 8.0),
          confirmpassword,
          SizedBox(height: 8.0),

          loginButton,
          ctext(),
          // forgotLabel,
          // ankit
        ],
      ),
      backgroundColor: Color(0xFF292F47),
    );
  }
}

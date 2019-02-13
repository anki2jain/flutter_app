import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/welcome.dart';
// import 'package:fluttertoast/fluttertoast.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

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

  Widget func() {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 8.0),
          TextFormField(
              validator: (input) {
                if (input.length < 8)
                  return "Make sure your password consists of atleast 8 letters";
              },
              autofocus: false,
              onSaved: (input) {
                _email = input;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Color(0xFF606687),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 20.0, color: Color(0xFF606687)),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF606687), width: 2.0),
                ),
              )),
          SizedBox(height: 8.0),
          TextFormField(
              validator: (input) {
                if (input.length < 8)
                  return "Make sure your password consists of atleast 8 letters";
              },
              autofocus: false,
              obscureText: true,
              onSaved: (input) {
                _password = input;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Color(0xFF606687),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 20.0, color: Color(0xFF606687)),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFF606687), width: 2.0),
                ),
              )),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: signin,
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text('Sign In', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget ctext() {
    return FlatButton(
        child: new Text("Wants to be member!"),
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        });
  }

//  final ctext= Padding(
//      padding: EdgeInsets.symmetric(vertical: 16.0),

//      child: new FlatButton(
//        child: new Text("Wants to be member!"),
//        onPressed: () {
//        Navigator.pushNamed(context, '/signup');

//        },
//      ),
//    );
  Future<void> signin() async {
    final formState = _formkey.currentState;
     
    if (formState.validate()) {
      // Navigator.of(context).pushNamed("/welcome");
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Welcome(user: user)));
      } catch (e) {
    //     Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIos: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
        // Navigator.pushNamed(context, '/signup');
        print(e); 
        // print("error");
        setState(() {
        Text("Details are not Valid",style: TextStyle(color: Colors.white,fontSize: 30.0),);  
        });
        
        // print(e.details);
        // print(e.code);
        // _showToast(context);
      }
      
    }
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
          func(),
          loginButton(),
          ctext(),
          // forgotLabel,
          // ankit
        ],
      ),
      backgroundColor: Color(0xFF292F47),
      //  Color(0xFF292F47),
    );
  }
}

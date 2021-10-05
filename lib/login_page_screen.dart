import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/images/flutter.png",
                  width: 200,
                  height: 200,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 15),

              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child: SizedBox(
            width: double.infinity,
              height: 45,
            child: ElevatedButton(
              onPressed: (){},
              child: Text("login",style: TextStyle(fontSize: 25),),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  )
              ),

            ),
          ),
          ),
          SizedBox(height: 10,),
          Text("Create an account",style: TextStyle(color: Colors.black87),)
        ],
      ),
    );
  }
}

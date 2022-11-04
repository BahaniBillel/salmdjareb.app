// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salmdjareb/screens/Ella.dart';
import 'package:salmdjareb/screens/Home.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _frmKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Signer(String email, String password) async {
    final formData = _frmKey.currentState;
    formData?.save();

    if (formData!.validate()) {
      print("all formsfields are valid");

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } else {
      print("not valid");
    }
  }

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "SignIn",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 15.0,
              ),
              Form(
                key: _frmKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          print("input field must be filled");
                        }
                      }),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Type your email here...",
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          print("input field must be filled");
                        }
                      }),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "Type your password here...",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        var user = Signer(
                            emailController.text, passwordController.text);
                        if (user != null) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                      icon: Icon(Icons.send),
                      label: Text("Register"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

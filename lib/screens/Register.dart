// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salmdjareb/screens/Ella.dart';
import 'package:salmdjareb/screens/Home.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:salmdjareb/screens/SignIn.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _frmKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Regista(String email, String password) async {
    final formData = _frmKey.currentState;
    formData?.save();

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user!.email != email) {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(
            context: context,
            title: "Weak password",
            desc: "please try to give strong password");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        AwesomeDialog(
                context: context,
                title: " email Error",
                desc: "The account already exists for that email",
                btnOk: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text("signIn")))
            .show();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Register",
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
                        dynamic user = Regista(
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

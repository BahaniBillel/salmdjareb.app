// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salmdjareb/screens/Home.dart';
import 'package:salmdjareb/screens/SignIn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .8,
                child: Opacity(
                  opacity: .2,
                  child: Image.asset(
                    'images/shape.png',
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN-IN",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Form(
                    key: formState,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.length > 10) {
                              return "the user name must over 10 characters length";
                            }

                            if (value.length < 4) {
                              return "the user name cannot be over 4 characters length";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            labelText: "Name",
                            hintText: "Type your name...",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            labelText: "Email",
                            hintText: "Enter your email",
                          ),
                          onChanged: (value) {},
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            labelText: "Password",
                            hintText: "Type your password",
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              var response = signUp(emailController.text,
                                  passwordController.text);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                            icon: Icon(Icons.send),
                            label: Text('Validate'))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    CircularProgressIndicator();
    if (formState.currentState!.validate()) {
      print('all formfields are valid');
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {});
    }
  }
}

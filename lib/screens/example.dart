// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                          controller: emailController,
                          validator: (value) {
                            if (value!.length > 100) {
                              return "email must over 100 characters length";
                            }

                            if (value.length < 5) {
                              return "email cannot be less than 5 characters length";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            labelText: "Email",
                            hintText: "Enter your email",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.length > 10) {
                              return "password must over 10 characters length";
                            }

                            if (value.length < 4) {
                              return "password cannot be over 4 characters length";
                            }

                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            labelText: "Password",
                            hintText: "Type your password",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              signUp(emailController.text,
                                  passwordController.text);
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
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .catchError((e) {});
    }
  }
}

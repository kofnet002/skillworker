// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skillworker/controllers/authcontroller.dart';
import 'package:skillworker/screens/auth/signup_page.dart';
import 'package:skillworker/screens/home_page.dart';
import 'package:skillworker/utils/image_picker.dart';
import 'package:skillworker/widgets/text_field_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPass = true;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const SignupPage())));
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'Login successful') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'images/logo.png',
                color: Colors.blue.shade800,
                height: 150,
              ),
              const SizedBox(
                height: 24,
              ),

              // username input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'Email',
                    icon: Icon(Icons.email),
                    textInputType: TextInputType.text),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFieldInput(
                    isPass: _isPass,
                    textEditingController: _passwordController,
                    icon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isPass = !_isPass;
                        });
                      },
                    ),
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword),
              ),

              // **************************** login button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: loginUser,
                  child: Container(
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        )),
                        color: Colors.blue.shade800),
                  ),
                ),
              ),

              // ********************transitioning to signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account? "),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

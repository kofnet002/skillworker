// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skillworker/controllers/authcontroller.dart';
import 'package:skillworker/screens/auth/login_page.dart';
import 'package:skillworker/screens/home_page.dart';
import 'package:skillworker/utils/image_picker.dart';
import 'package:skillworker/widgets/text_field_input.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPass = true;
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const LoginPage())));
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void registerUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      file: _image!,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'Successfully registered') {
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/logo.png',
                    color: Colors.blue.shade800,
                    height: 50,
                  ),
                  const Text(
                    'Skillworker',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://www.mtsolar.us/wp-content/uploads/2020/04/avatar-placeholder.png'),
                              ),
                        Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: Icon(Icons.add_a_photo),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    // username input
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldInput(
                          textEditingController: _usernameController,
                          hintText: 'Username',
                          icon: Icon(Icons.person),
                          textInputType: TextInputType.text),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                          icon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isPass = !_isPass;
                              });
                            },
                          ),
                          textEditingController: _passwordController,
                          hintText: 'Password',
                          textInputType: TextInputType.visiblePassword),
                    ),

                    // **************************** login button
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: registerUser,
                        child: Container(
                          child: _isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                )
                              : Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
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
                          child: const Text("Already have an account? "),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        GestureDetector(
                          onTap: navigateToLogin,
                          child: Container(
                            child: const Text(
                              "Login",
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
          ],
        ),
      ),
    );
  }
}

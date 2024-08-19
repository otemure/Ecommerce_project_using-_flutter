import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:first_project/widgets.dart';
import 'login_page.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUp();
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'images/Vector.svg',
                height: 80.0,
                width: 100.0,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Forms(
                  nameController: _nameController,
                  labelName: 'Name',
                  obscuretext: false,
                  icon: const Icon(
                    Icons.person,
                    color: Color(0xffF67952),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Email field
              Forms(
                nameController: _emailController,
                labelName: 'Email',
                obscuretext: false,
                icon: const Icon(
                  Icons.email,
                  color: Color(0xffF67952),
                ),
              ),
              const SizedBox(height: 16.0),
              // Password field
              Forms(
                nameController: _passwordController,
                labelName: 'Password',
                obscuretext: true,
                icon: const Icon(
                  Icons.lock,
                  color: Color(0xffF67952),
                ),
              ),
              const SizedBox(height: 24.0),
              // Submit button
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xffF67952),
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'I accept all the ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF67952),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 60,
                    child: const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("or"),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/fb.svg',
                    height: 100.0,
                    width: 100.0,
                  ),
                  SvgPicture.asset(
                    'images/google.svg',
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

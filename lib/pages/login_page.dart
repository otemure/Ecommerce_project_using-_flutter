import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:first_project/widgets.dart';
import 'package:first_project/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
  const  LoginPage();

  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                "Log in",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('forgot password?'),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //
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
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                    height: 60, child: Text('__________  or  ___________')),
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
                    text: 'Don\'t have an account?\n',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up',
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

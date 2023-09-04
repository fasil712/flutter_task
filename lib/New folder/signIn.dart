import 'package:flutter/material.dart';
import 'package:flutter_task/New folder/register.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 250, 250),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100.0),
              const Text(
                "SIGN IN",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'WorkSans',
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Email",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                                255, 0, 0, 0)), // Change the color as desired
                      ),
                      hintText: 'Abebe@gmail.com',
                      contentPadding:
                          EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
                ),
              ),
              const SizedBox(height: 22.0),
              const Text(
                "Enter Password",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3.0),
              Container(
                color: Colors.white,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                                255, 0, 0, 0)), // Change the color as desired
                      ),
                      hintText: '* * * * * * * * *',
                      contentPadding:
                          EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
                ),
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                width: 600,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement login functionality
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(16.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0)),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have An Account?",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

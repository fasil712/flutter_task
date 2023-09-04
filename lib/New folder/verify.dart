import 'package:flutter/material.dart';

class VerifyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 253, 250, 250),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100.0),
                const Text(
                  "OTP",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'WorkSans',
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "Insert the OTP sent to your number",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 3),
                const Text("0912345678"),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                          width: 40.0,
                          color: Colors.white,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0,
                                        0)), // Change the color as desired
                              ),
                            ),
                          )),
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.white,
                          width: 40.0,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0,
                                        0)), // Change the color as desired
                              ),
                            ),
                          )),
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.white,
                          width: 40.0,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 10, 11,
                                        11)), // Change the color as desired
                              ),
                            ),
                          )),
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.white,
                          width: 40.0,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0,
                                        0)), // Change the color as desired
                              ),
                            ),
                          )),
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.white,
                          width: 40.0,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0,
                                        0)), // Change the color as desired
                              ),
                            ),
                          )),
                    ),
                    Flexible(
                      child: Container(
                          color: Colors.white,
                          width: 40.0,
                          child: TextFormField(
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 0,
                                        0)), // Change the color as desired
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 600,
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'CONTINUE',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

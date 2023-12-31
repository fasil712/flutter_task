import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.mainColor,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlexibleInput(),
                    FlexibleInput(),
                    FlexibleInput(),
                    FlexibleInput(),
                    FlexibleInput(),
                    FlexibleInput(),
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
                          AppColors.buttonBackgroundColor),
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

class FlexibleInput extends StatelessWidget {
  const FlexibleInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: 40.0,
          color: Colors.white,
          child: TextFormField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(
                        255, 0, 0, 0)), // Change the color as desired
              ),
            ),
          )),
    );
  }
}

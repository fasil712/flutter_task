import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/login_screen.dart';

import '/cubits/cubits.dart';
import '/repositories/repositories.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 250, 250),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: BlocProvider<SignupCubit>(
            create: (_) => SignupCubit(context.read<AuthRepository>()),
            child: const SignupForm(),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.of(context).pop();
        } else if (state.status == SignupStatus.error) {
          // Nothing for now.
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100.0),
          const Text(
            "REGISTER",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 30.0,
              fontFamily: 'WorkSans',
            ),
          ),
          const SizedBox(height: 30.0),
          const Text(
            "First Name",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3.0),
          _EmailInput(),
          const SizedBox(height: 22.0),
          const Text(
            "Last Name",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          _LastNameInput(),
          const SizedBox(height: 3.0),
          const SizedBox(height: 22.0),
          const Text(
            "Enter Password",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3.0),
          _PasswordInput(),
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
          _SignupButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't Have An Account?",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).push<void>(LoginScreen.route()),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: TextFormField(
            onChanged: (email) {
              context.read<SignupCubit>().emailChanged(email);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 0, 0, 0)), // Change the color as desired
                ),
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
          ),
        );
      },
    );
  }
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: TextFormField(
            onChanged: (password) {
              context.read<SignupCubit>().passwordChanged(password);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 0, 0, 0)), // Change the color as desired
                ),
                hintText: 'Abebe Kebede',
                contentPadding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
            obscureText: true,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: TextFormField(
            onChanged: (password) {
              context.read<SignupCubit>().passwordChanged(password);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 0, 0, 0)), // Change the color as desired
                ),
                hintText: '* * * * * * * * *',
                contentPadding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
            obscureText: true,
          ),
        );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : Container(
                width: 600,
                child: ElevatedButton(
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
                  onPressed: () {
                    context.read<SignupCubit>().signupFormSubmitted();
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              );
      },
    );
  }
}

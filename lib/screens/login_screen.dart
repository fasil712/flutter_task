import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cubits/cubits.dart';
import '/repositories/repositories.dart';
import '/screens/screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 250, 250),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: BlocProvider(
            create: (_) => LoginCubit(context.read<AuthRepository>()),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {}
      },
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
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3.0),
          _EmailInput(),
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
          _LoginButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't Have An Account?",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).push<void>(SignupScreen.route()),
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
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: TextFormField(
            onChanged: (email) {
              context.read<LoginCubit>().emailChanged(email);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 0, 0, 0)), // Change the color as desired
                ),
                hintText: 'Abebe@gmail.com',
                contentPadding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: TextFormField(
            onChanged: (password) {
              context.read<LoginCubit>().passwordChanged(password);
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

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
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
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    context.read<LoginCubit>().logInWithCredentials();
                  },
                ),
              );
      },
    );
  }
}

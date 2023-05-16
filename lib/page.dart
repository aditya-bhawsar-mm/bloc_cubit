import 'package:bloc_cubit/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(LoginRepo()),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(child: buildPage(context)),
            appBar: AppBar(
              title: const Text("Login"),
            ),
          );
        },
        listener: (BuildContext context, state) {
          if (state is Success) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Success")));
          } else if (state is Failed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Failed")));
          }

        },
      ),
    );
  }

  Widget buildPage(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, selected) {
      return Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(24),
              child: FlutterLogo(
                size: 120,
              )),
          Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 3)),
                    labelText: 'Username',
                    hintText: 'Enter Username'),
                controller: context.read<LoginCubit>().usernameContorller,
              )),
          Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 3)),
                    labelText: 'Password',
                    hintText: 'Enter Password'),
                controller: context.read<LoginCubit>().passwordContorller,

              )),
          Padding(padding: const EdgeInsets.all(8), child: loginButton(context))
        ],
      );
    });
  }


  Widget loginButton(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, selected) {
      if (selected is Loading) {
        return const CircularProgressIndicator();
      }
      return MaterialButton(
          child: const Text('Login'),
          onPressed: () {
            context.read<LoginCubit>().login();
          });
    });
  }
}

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartimpact/src/cubit/auth_cubit.dart';

enum AuthType { login, signup }

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  AuthType authType = AuthType.login;
  TextEditingController id = TextEditingController();
  TextEditingController pwd = TextEditingController();
  String? idError;
  String? pwdError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: authType == AuthType.login ? login() : signup(),
        ),
      ),
    );
  }

  Widget login() => BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) => previous != current,
        bloc: context.read<AuthCubit>(),
        builder: (context, state) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Smart Impact",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: id,
                onChanged: (value) {
                  //id.text = value;
                },
                decoration: InputDecoration(
                    errorText: idError,
                    border: const OutlineInputBorder(),
                    labelText: "Identifiants",
                    hintText: "monIdentifiant"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: pwd,
                onChanged: (value) {
                  //pwd.text = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    errorText: pwdError,
                    border: const OutlineInputBorder(),
                    labelText: "Mot de passe",
                    hintText: "super mot de passe"),
              ),
              const SizedBox(
                height: 15,
              ),
              state is AuthLoading || state is AuthSuccess
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (id.text.isNotEmpty && pwd.text.isNotEmpty) {
                          context.read<AuthCubit>().login(id.text, pwd.text);
                        } else {
                          if (id.text.isEmpty) {
                            setState(() {
                              idError = "entrez un identifiant";
                            });
                          } else {
                            setState(() {
                              idError = null;
                            });
                          }
                          if (pwd.text.isEmpty) {
                            setState(() {
                              pwdError = "entrez un mot de passe";
                            });
                          } else {
                            setState(() {
                              pwdError = null;
                            });
                          }
                        }
                      },
                      child: const Text("Se connecter")),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      authType = AuthType.signup;
                    });
                  },
                  child: const Text("créer un compte"))
            ],
          ),
        ),
      );

  Widget signup() => BlocBuilder<AuthCubit, AuthState>(
        bloc: context.read<AuthCubit>(),
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Smart Impact",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: id,
                onChanged: (value) {
                  //id.text = value;
                },
                decoration: InputDecoration(
                    errorText: idError,
                    border: const OutlineInputBorder(),
                    labelText: "Identifiants",
                    hintText: "monIdentifiant"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: pwd,
                onChanged: (value) {
                  //pwd.text = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    errorText: pwdError,
                    border: const OutlineInputBorder(),
                    labelText: "Mot de passe",
                    hintText: "super mot de passe"),
              ),
              const SizedBox(
                height: 15,
              ),
              state is AuthLoading || state is AuthSuccess
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (id.text.isNotEmpty && pwd.text.isNotEmpty) {
                          context.read<AuthCubit>().signup(id.text, pwd.text);
                        } else {
                          if (id.text.isEmpty) {
                            setState(() {
                              idError = "entrez un identifiant";
                            });
                          } else {
                            setState(() {
                              idError = null;
                            });
                          }
                          if (pwd.text.isEmpty) {
                            setState(() {
                              pwdError = "entrez un mot de passe";
                            });
                          } else {
                            setState(() {
                              pwdError = null;
                            });
                          }
                        }
                      },
                      child: const Text("Créer un compte")),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      authType = AuthType.login;
                    });
                  },
                  child: const Text("Déja un compte ? Connectez vous"))
            ],
          ),
        ),
      );
}

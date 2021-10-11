import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_input.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/authentication/forgot_screen.dart';
import 'package:bokshaul_haulier/screens/authentication/register_screen.dart';
import 'package:bokshaul_haulier/screens/logged/index.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/boksman_logo.png',
                    height: layoutHeight(context) / 4,
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        textInput(
                          _usernameController,
                          "Username",
                          "boksmanasia",
                          const Icon(Icons.perm_identity),
                        ),
                        const SizedBox(height: 10),
                        passwordInput(
                          _passwordController,
                          "Password",
                          const Icon(Icons.lock),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              dissmissBoard(context);
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  // _isLoading = true;
                                });
                                fixedTo(context, const Index(index: 0));
                              }
                            },
                            child: Text(
                              "Masuk",
                              style: kHeadline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      navigateTo(context, const ForgotPassword());
                    },
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: kHeadline,
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Colors.black),
                      ),
                      Text(
                        "ATAU",
                        style: kBody.copyWith(color: Colors.grey),
                      ),
                      const Expanded(
                        child: Divider(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      navigateTo(context, const RegisterScreen());
                    },
                    child: Text(
                      "Buat Akun Baru",
                      style: kBody,
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
        showLoading(context, _isLoading),
      ],
    ));
  }
}

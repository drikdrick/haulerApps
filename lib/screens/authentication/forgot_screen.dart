import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_input.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/authentication/verify_otp_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lupa Password"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Masukkan Email Anda",
                  ),
                  const SizedBox(height: 25),
                  textInput(_emailController, "Email", "",
                      const Icon(Icons.alternate_email)),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: layoutWidth(context),
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // setState(() {
                            //   _isLoading = true;
                            // });
                            fixedTo(context,
                                VerifyOtp(emailUser: _emailController.text));
                            _isLoading = false;
                            // Future.delayed(Duration(seconds: 2)).then((value) {
                            //   setState(() {
                            //     navigateTo(context, VerifyOtp(emailUser: _emailController.text));
                            //     _isLoading = false;
                            //   });
                            //   displayResponse(context, Colors.blue, "Berhasil");
                            // });
                          }
                        },
                        child: Text(
                          "Kirim Kode",
                          style: kHeadline,
                        )),
                  )
                ],
              ),
            ),
          ),
          _isLoading ? showLoading(context) : SizedBox(),
        ],
      ),
    );
  }
}

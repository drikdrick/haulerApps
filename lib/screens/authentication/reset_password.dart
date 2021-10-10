import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_input.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Silahkan Masukkan Password Baru."),
              const SizedBox(height: 20),
              passwordInput(_newPassword, "Password", const Icon(Icons.lock)),
              const SizedBox(height: 10),
              passwordInput(_rePassword, "Ulangi Password", const Icon(Icons.lock_outline)),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  _formKey.currentState!.validate();
                }, child: Text("Simpan")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

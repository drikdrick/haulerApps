import '../../../components/profile/update_profile.dart';
import '../../../helpers/layout.dart';
import '../../../helpers/text_input.dart';
import '../../../helpers/text_style.dart';
import 'package:flutter/material.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Password"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  passwordInput(
                      _oldPassword, "Password Lama", const Icon(Icons.lock)),
                  const SizedBox(height: 10),
                  passwordInput(
                      _newPassword, "Password Baru", const Icon(Icons.lock)),
                  const SizedBox(height: 10),
                  passwordInput(
                      _rePassword, "Ulangi Password", const Icon(Icons.lock)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        dissmissBoard(context);
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          editPassword(context, _oldPassword.text,
                                  _newPassword.text, _rePassword.text)
                              .then((value) {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        }
                      },
                      child: Text(
                        "Simpan",
                        style: kHeadline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          showLoading(context, _isLoading),
        ],
      ),
    );
  }
}

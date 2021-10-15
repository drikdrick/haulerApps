import 'package:bokshaul_haulier/components/function/register.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_input.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profil"),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Image.asset(
                      //   'assets/images/boksman_logo.png',
                      //   height: layoutHeight(context) / 8,
                      // ),
                      const SizedBox(height: 10),
                      textInput(_companyName, "Company", "Contoh: Boksman Asia",
                          const Icon(Icons.business_center)),
                      const SizedBox(height: 10),
                      phoneInput(
                          _phoneNumber, "Phone", "", const Icon(Icons.phone)),
                      const SizedBox(height: 10),
                      textInput(_usernameController, "Username", "",
                          const Icon(Icons.perm_identity)),
                      const SizedBox(height: 10),
                      textInput(_emailController, "Email", "",
                          const Icon(Icons.alternate_email)),
                      const SizedBox(height: 10),
                      const SizedBox(height: 25),
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
            ),
            showLoading(context, _isLoading),
          ],
        ));
  }
}

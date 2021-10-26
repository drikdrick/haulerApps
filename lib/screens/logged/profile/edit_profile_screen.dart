import '../../../components/profile/update_profile.dart';
import '../../../helpers/layout.dart';
import '../../../helpers/text_input.dart';
import '../../../helpers/text_style.dart';
import '../../../models/user_model.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.currentUser}) : super(key: key);
  final User currentUser;
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _companyName.text = widget.currentUser.company;
    _phoneNumber.text = widget.currentUser.phone;
    _usernameController.text = widget.currentUser.username;
    _emailController.text = widget.currentUser.email;
  }

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
                      const SizedBox(height: 10),
                      textInput(_companyName, "Company", "Contoh: Boksman Asia",
                          const Icon(Icons.business_center)),
                      const SizedBox(height: 10),
                      phoneInput(
                          _phoneNumber, "Phone", const Icon(Icons.phone)),
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
                                _isLoading = true;
                              });
                              editProfile(
                                      context,
                                      _companyName.text,
                                      _phoneNumber.text,
                                      _emailController.text,
                                      _usernameController.text)
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
            ),
            showLoading(context, _isLoading),
          ],
        ));
  }
}

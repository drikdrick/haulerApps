import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/authentication/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key, required this.emailUser}) : super(key: key);
  final String emailUser;

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi Kode'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text("Masukkan Kode Yang Dikirim Ke"),
                Text(
                  widget.emailUser,
                  style: kHeadline,
                ),
                const SizedBox(height: 15),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  appContext: context,
                  length: 4,
                  animationType: AnimationType.fade,
                  autoFocus: true,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onChanged: (value) {
                    print(value);
                  },
                  onCompleted: (value) {
                    setState(() {
                      _isLoading = true;
                    });
                    Future.delayed(Duration(seconds: 1))
                        .then((value) => fixedTo(context, ResetPassword()));
                  },
                ),
              ],
            ),
          ),
          showLoading(context, _isLoading),
        ],
      ),
    );
  }
}

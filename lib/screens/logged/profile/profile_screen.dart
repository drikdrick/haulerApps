import 'package:bokshaul_haulier/components/profile/profile_tile.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/screens/logged/profile/call_center.dart';
import 'package:bokshaul_haulier/screens/logged/profile/edit_password_screen.dart';
import 'package:bokshaul_haulier/screens/logged/profile/edit_profile_screen.dart';
import 'package:bokshaul_haulier/screens/logged/profile/privacy_policy.dart';
import 'package:bokshaul_haulier/screens/logged/profile/term_condition.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.withOpacity(0.75),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PDT Truck",
                            style: kTitle.copyWith(
                                fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "Hania",
                            style: kHeadline.copyWith(color: Colors.white),
                          ),
                          Text(
                            "hania.thalib@pancaran-group.com",
                            style: kBody.copyWith(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          profileTile(
              context, Icons.person, "Ubah Profile", const EditProfile()),
          profileTile(
              context, Icons.lock, "Ganti Password", const EditPassword()),
          profileTile(
            context,
            Icons.privacy_tip,
            "Kebijakan Privasi",
            const PrivacyPolicy(),
          ),
          profileTile(
            context,
            Icons.quiz,
            "Syarat dan Ketentuan",
            const TermCondition(),
          ),
          profileTile(
            context,
            Icons.headset_mic,
            "Hubungi Boksman",
            const CallCenter(),
          ),
          profileTile(
            context,
            Icons.logout,
            "Keluar",
            const CallCenter(),
          ),
        ],
      ),
    );
  }
}

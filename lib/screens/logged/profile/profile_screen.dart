import 'package:bokshaul_haulier/components/profile/profile_tile.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:bokshaul_haulier/models/user_model.dart';
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
  late Future<User> futureUser;
  late User currentUser;
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  _refreshData() {
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureUser,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.username,
                                  style: kTitle.copyWith(
                                      fontSize: 20, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  snapshot.data!.address,
                                  style: kBody.copyWith(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "+" + snapshot.data!.phone,
                                  style: kBody.copyWith(
                                      fontSize: 14, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  snapshot.data!.email,
                                  style: kBody.copyWith(
                                      fontSize: 14, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              profileTile(
                context,
                Icons.person,
                "Ubah Profile",
                EditProfile(
                  currentUser: snapshot.data!,
                ),
              ),
              profileTile(
                context,
                Icons.lock,
                "Ganti Password",
                const EditPassword(),
              ),
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
              logoutTile(
                context,
                Icons.logout,
                "Keluar",
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }

        return showLoading(context, true);
      },
    );
  }
}

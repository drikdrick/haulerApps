// import 'package:bokshaul_haulier/components/profile/profile_tile.dart';
import 'package:bokshaul_haulier/components/profile/profile_tile.dart';
import 'package:bokshaul_haulier/helpers/launcher.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart' as url_launcher;

class CallCenter extends StatefulWidget {
  const CallCenter({Key? key}) : super(key: key);

  @override
  _CallCenterState createState() => _CallCenterState();
}

class _CallCenterState extends State<CallCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call Center"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("Email ke Boksman"),
              tileColor: Colors.white,
              onTap: () {
                openEmail();
              },
              leading: const Icon(
                Icons.mark_email_read,
                color: Colors.blue,
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
            const Divider(),
            ListTile(
              title: const Text("Whatsapp ke Boksman"),
              tileColor: Colors.white,
              onTap: () {
                openWhatsapp();
              },
              leading: CircleAvatar(
                radius: 12,
                child: Image.asset("assets/images/wa.png"),
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
            const Divider(),
            ListTile(
              title: const Text("Telepon Boksman"),
              tileColor: Colors.white,
              onTap: () {
                openPhone();
              },
              leading: const Icon(
                Icons.phone_callback,
                color: Colors.green,
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
            // callCenterTile(
            //   "Email ke Boksman",
            //   openPhone(),
            //   const Icon(
            //     Icons.mark_email_read,
            //     color: Colors.blue,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

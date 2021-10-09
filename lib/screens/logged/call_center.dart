import 'package:bokshaul_haulier/components/profile/profile_tile.dart';
import 'package:bokshaul_haulier/helpers/launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

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
            callCenterTile(
              "Email ke Boksman",
              openEmail(),
              const Icon(
                Icons.mark_email_read,
                color: Colors.blue,
              ),
            ),
            callCenterTile(
              "Whatsapp ke Boksman",
              openWhatsapp(),
              CircleAvatar(
                radius: 12,
                child: Image.asset("assets/images/wa.png"),
              ),
            ),
            callCenterTile(
              "Telepon Boksman",
              openPhone(),
              const Icon(
                Icons.phone_callback,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

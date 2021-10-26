import '../../../helpers/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KEBIJAKAN PRIVASI"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy for Boksman Hauler",
                style: kHeadline,
              ),
              const SizedBox(height: 10),
              Text(
                "At BoksMan, accessible from bokshaul.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by BoksMan and how we use it.",
                textAlign: TextAlign.justify,
                style: kBodySmall,
              ),
              const SizedBox(height: 10),
              Text(
                "If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.",
                textAlign: TextAlign.justify,
                style: kBodySmall,
              ),
              const Divider(),
              Text(
                "Log Files",
                style: kHeadline,
              ),
              const SizedBox(height: 10),
              Text(
                "BoksMan follows a standard procedure of using log files. These files log visitors when they visit app. All hosting companies do this and a part of hosting services' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users' movement on the app, and gathering demographic information.",
                textAlign: TextAlign.justify,
                style: kBodySmall,
              ),
              const Divider(),
              Text(
                "Privacy Policies",
                style: kHeadline,
              ),
              Text(
                "BoksMan's Privacy Policy does not apply to other advertisers or apps. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.",
                textAlign: TextAlign.justify,
                style: kBodySmall,
              ),
              const Divider(),
              Text(
                "Online Privacy Policy Only",
                style: kHeadline,
              ),
              const SizedBox(height: 10),
              Text(
                "This Privacy Policy applies only to our online activities and is valid for visitors to our app with regards to the information that they shared and/or collect in BoksMan. This policy is not applicable to any information collected offline or via channels other than this app.",
                textAlign: TextAlign.justify,
                style: kBodySmall,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

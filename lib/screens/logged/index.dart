import 'package:bokshaul_haulier/screens/logged/home_screen.dart';
// import 'package:bokshaul_haulier/screens/logged/invoice/invoice_screen.dart';
import 'package:bokshaul_haulier/screens/logged/order/order_screen.dart';
import 'package:bokshaul_haulier/screens/logged/profile/profile_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  final int index;
  const Index({Key? key, required this.index}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late int bottomIndex;

  @override
  void initState() {
    super.initState();
    bottomIndex = widget.index;
  }


  final List<Widget> _widget = [
    const HomeScreen(),
    const OrderScreen(),
    // const InvoiceScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[bottomIndex],
      //Bottom NavBar
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: bottomIndex,
        backgroundColor: Colors.blue,
        // curveSize: ,
        height: 45,
        items: const [
          TabItem(icon: Icons.auto_awesome_mosaic, activeIcon: Icons.auto_awesome_mosaic_outlined,title: "Home"),
          TabItem(icon: Icons.format_list_bulleted, activeIcon: Icons.format_list_bulleted, title: "Order"),
          // TabItem(icon: Icons.article, activeIcon: Icons.article_outlined,title: "Invoice"),
          TabItem(icon: Icons.person_pin, activeIcon: Icons.person_pin, title: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            bottomIndex = value;
          });
        },
      ),
    );
  }
}

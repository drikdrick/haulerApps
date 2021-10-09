import 'package:bokshaul_haulier/screens/logged/home_screen.dart';
import 'package:bokshaul_haulier/screens/logged/invoice_screen.dart';
import 'package:bokshaul_haulier/screens/logged/order_screen.dart';
import 'package:bokshaul_haulier/screens/logged/profile_screen.dart';
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
    // TODO: implement initState
    super.initState();
    bottomIndex = widget.index;
  }

  final List<BottomNavigationBarItem> _bottomItems = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home_outlined,
      ),
      activeIcon: Icon(
        Icons.home,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Order',
      icon: Icon(
        Icons.directions_car_filled_outlined,
      ),
      activeIcon: Icon(
        Icons.directions_car,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Invoice',
      icon: Icon(
        Icons.article_outlined,
      ),
      activeIcon: Icon(
        Icons.article,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.account_circle_outlined,
      ),
      activeIcon: Icon(
        Icons.account_circle,
        color: Colors.blue,
      ),
    ),
  ];

  final List<Widget> _widget = [
    const HomeScreen(),
    const OrderScreen(),
    const InvoiceScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[bottomIndex],
      //Bottom NavBar
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        // curveSize: ,
        height: 45,
        items: const [
          TabItem(icon: Icons.auto_awesome_mosaic, activeIcon: Icons.auto_awesome_mosaic_outlined,title: "Home"),
          TabItem(icon: Icons.online_prediction_rounded, activeIcon: Icons.online_prediction_rounded, title: "Order"),
          TabItem(icon: Icons.article, activeIcon: Icons.article_outlined,title: "Invoice"),
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

import 'package:flutter/material.dart';
import 'package:retail_mobile/presentation/screens/dashboard/sidebar_navigation.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarNavigation(),
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('DashBoard'),
        ),
      ),
    );
  }
}

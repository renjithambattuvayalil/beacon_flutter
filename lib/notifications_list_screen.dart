import 'package:beacon_flutter_mobapp/alerts_list_screen.dart';
import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_reports_list_screen.dart';
import 'package:beacon_flutter_mobapp/profile_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class NotificationsListScreen extends StatelessWidget {
  const NotificationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(Images.hamBurgerIcon, color: Colors.black87),
        titleSpacing: 0,
        title: const Text('Notifications', style: TextStyle(color: Colors.black87)),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black87),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (_, index) {
            return Card(
              elevation: 3,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Image.asset(Images.police, width: 30),
                    minLeadingWidth: 0,
                    horizontalTitleGap: 5,
                    title: const Text('Saudi Police', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    subtitle: const Text('Important Notice to people travelling',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {},
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 50),
                      Text('04 May 2022 9:30 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          currentIndex: 3,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 18), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.description, size: 18), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.alarm, size: 18), label: 'Alerts'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_active, size: 18), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded, size: 18), label: 'More'),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
                  return const DashboardScreen();
                }),(route) => false);
                break;
              case 1:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return const IncidentReportsListScreen();
                }));
                break;
              case 2:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return AlertsListScreen();
                }));
                break;
              //case 3: this screen
              case 4:
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const ProfileViewScreen();
                }));
                break;
            }
          },
        ),
      ),
    );
  }
}

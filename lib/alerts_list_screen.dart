import 'package:beacon_flutter_mobapp/alert_view_screen.dart';
import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_reports_list_screen.dart';
import 'package:beacon_flutter_mobapp/models/alert.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/profile_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class AlertsListScreen extends StatelessWidget {
  AlertsListScreen({Key? key}) : super(key: key);
  final List<Alert> alertsList = [
    Alert(
        iconPath: Images.police,
        title: 'Saudi Police',
        description: 'Important notice to people travelling',
        alertDateTime: '2 hours ago 10:15 AM'),
    Alert(
        iconPath: Images.police,
        title: 'Saudi Police',
        description: 'Be safe during city expo event',
        alertDateTime: '05 Mar 2022 09:15 AM'),
    Alert(
        iconPath: Images.water,
        title: 'Saudi Water Authority',
        description: 'Water supply affected in Riyadh',
        alertDateTime: '03 Mar 2022 09:30 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(Images.hamBurgerIcon, color: Colors.black87),
        titleSpacing: 0,
        title: const Text('My Alerts', style: TextStyle(color: Colors.black87)),
        actions: const [
          Icon(Icons.search, color: Colors.black87),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: alertsList.length,
          itemBuilder: (_, index) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Image.asset(alertsList[index].iconPath!, width: 30),
                      horizontalTitleGap: 0,
                      title:
                          Text(alertsList[index].title!, style: TextStyle(fontSize: 12, color: Colors.blue.shade200)),
                      subtitle: Text(alertsList[index].description!,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.arrow_forward, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Text(alertsList[index].alertDateTime!, style: const TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const AlertViewScreen();
                }));
              },
            );
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          currentIndex: 2,
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
              //case 2: this screen
              case 3:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return const NotificationsListScreen();
                }));
                break;
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

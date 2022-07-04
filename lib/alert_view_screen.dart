import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_reports_list_screen.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/profile_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class AlertViewScreen extends StatelessWidget {
  const AlertViewScreen({Key? key}) : super(key: key);
  final String sampleDescription =
      'Important notice to people travelling for Vacations during the summer break. This is a sample description for the title important notice to people travelling for Vacations during the summer break. This is a sample description for the title important notice to people travelling for Vacations during the summer break.';
  final String conclusion = 'This is the conclusion line. This is the conclusion line. This is the conclusion line. ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //leading: Image.asset(Images.backIcon, color: Colors.black87),
        leading: const BackButton(color: Colors.black87),
        titleSpacing: 0,
        title: const Text('Viewing Alert', style: TextStyle(color: Colors.black87)),
        actions: [
          const Icon(Icons.share_outlined, color: Colors.black87),
          Image.asset(Images.download),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                //shall give the padding for container
                leading: Image.asset(Images.police, width: 50),
                horizontalTitleGap: 5,
                title: const Text('Saudi Police', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('05 Mar 2022 09:30 AM', style: TextStyle(color: Colors.blue, fontSize: 12)),
              ),
              Divider(color: Colors.blue.shade100, thickness: 2, indent: 10, endIndent: 10),
              const SizedBox(height: 15),
              const Text(
                'Important Notice to people travelling for Vacations during the summer break',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset('assets/images/alert_pic.png'),
              const SizedBox(height: 10),
              Text(sampleDescription, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 10),
              Text(conclusion, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 20),
              const Divider(color: Colors.black, thickness: 4, indent: 130, endIndent: 130),
            ],
          ),
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
                }), (route) => false);
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

import 'package:beacon_flutter_mobapp/alerts_list_screen.dart';
import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_reports_list_screen.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        //leading: Image.asset(Images.backIcon, color: Colors.white),
        leading: const BackButton(color: Colors.white),
        title: const Text('My Profile'),
        actions: const [
          Icon(Icons.more_vert),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(flex: 1, child: SizedBox(height: 200)),
          Expanded(
            flex: 4,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    //physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 130),
                        const Text('Phone', style: TextStyle(color: Colors.grey)),
                        const Text('+966 -98765432', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        const Text('Registered Department', style: TextStyle(color: Colors.grey)),
                        const Text('Saudi Police', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        const Text('User ID', style: TextStyle(color: Colors.grey)),
                        const Text('UID-1234-5678', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        const Text('Active Since', style: TextStyle(color: Colors.grey)),
                        const Text('April 2022', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text('Change Password', style: TextStyle(color: Colors.blue)),
                            const SizedBox(width: 10),
                            Image.asset(Images.pen),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Image.asset(Images.profileBanner),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -68,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 68,
                        //backgroundImage: AssetImage(Images.myProfilePic), //it will fit fully, but no background visible
                        backgroundColor: Colors.grey.shade400,
                        //it will fit as per the radius, background color can be given to have a border appearance
                        child: Image.asset(Images.myProfilePic),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('Hazmat Mohammed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(width: 10),
                          Image.asset(Images.correct),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          currentIndex: 4,
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
              case 2:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return AlertsListScreen();
                }));
                break;
              case 3:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return const NotificationsListScreen();
                }));
                break;
              //case 4: this screen
            }
          },
        ),
      ),
    );
  }
}

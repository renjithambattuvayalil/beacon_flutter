import 'package:beacon_flutter_mobapp/alerts_list_screen.dart';
import 'package:beacon_flutter_mobapp/incident_reports_list_screen.dart';
import 'package:beacon_flutter_mobapp/new_incident_info_screen.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/penalties_list_screen.dart';
import 'package:beacon_flutter_mobapp/profile_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 30,
        leadingWidth: 75,
        leading: Image.asset(Images.hamBurgerIcon),
        titleSpacing: 0,
        title: const Text('Dashboard'),
        actions: const [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(Images.profilePic1),
          ),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 15),
        ],
      ),
      body: Stack(
        //clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          topContainer(context),
          Positioned(top: 130, child: bottomContainer(context)),
          Positioned(
            top: 90,
            child: Row(
              children: [
                reportIncidentContainer(context),
                const SizedBox(width: 5),
                myAlertsContainer(context),
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
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 18), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.description, size: 18), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.alarm, size: 18), label: 'Alerts'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_active, size: 18), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded, size: 18), label: 'More'),
          ],
          onTap: (index) {
            switch (index) {
              //case 0: this screen
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

  Widget myAlertsContainer(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 160,
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF307dc1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text('MY\nALERTS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Image.asset(
                      'assets/images/myAlert.png',
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                const SizedBox(height: 15),
                Image.asset(Images.polygon),
              ],
            ),
            ElevatedButton(
              child: const Text('→', style: TextStyle(color: Colors.black87)),
              style: ElevatedButton.styleFrom(primary: Colors.white, shape: const CircleBorder()),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AlertsListScreen();
                }));
              },
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return AlertsListScreen();
        }));
      },
    );
  }

  Widget reportIncidentContainer(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 160,
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        decoration: const BoxDecoration(
          color: Color(0xFFff5360),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text('REPORT\nINCIDENT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Image.asset('assets/images/plus.png'),
                    const SizedBox(width: 15),
                  ],
                ),
                const SizedBox(height: 15),
                Image.asset(Images.polygon),
              ],
            ),
            Positioned(
              child: ElevatedButton(
                child: const Text('→', style: TextStyle(color: Colors.black87)),
                style: ElevatedButton.styleFrom(primary: Colors.white, shape: const CircleBorder()),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const NewIncidentInfoScreen();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const NewIncidentInfoScreen();
        }));
      },
    );
  }

  Widget bottomContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Row(
            children: const [
              Text('INCIDENTS'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomContainerCard(
                  imagePath: Images.createReport,
                  title: 'CREATE\nNEW REPORT',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const NewIncidentInfoScreen();
                    }));
                  }),
              const SizedBox(width: 10),
              BottomContainerCard(
                  imagePath: Images.viewReport,
                  title: 'VIEW\nMY REPORT',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const IncidentReportsListScreen();
                    }));
                  }),
              const SizedBox(width: 10),
              BottomContainerCard(
                  imagePath: Images.importantAlert,
                  title: 'IMPORTANT\nALERTS',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AlertsListScreen();
                    }));
                  }),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomContainerCard(imagePath: Images.allAuthorities, title: 'ALL\nAUTHORITIES', onTap: () {}),
              const SizedBox(width: 10),
              BottomContainerCard(
                  imagePath: Images.myPenalties,
                  title: 'MY\nPENALTIES',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const PenaltiesListScreen();
                    }));
                  }),
              const SizedBox(width: 10),
              BottomContainerCard(imagePath: Images.myPayments, title: 'MY\nPAYMENTS', onTap: () {}),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.whdBanner), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 115),
        ],
      ),
    );
  }

  Widget topContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF050505),
      child: Column(
        children: [
          const Divider(color: Colors.white54),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Want to Report an Incident?', style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 10),
                Text(
                  'You may please report an incident to the concerned authorities',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomContainerCard extends StatelessWidget {
  final String imagePath, title;
  final VoidCallback onTap;

  //final Function() onTap; //this will also work

  const BottomContainerCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

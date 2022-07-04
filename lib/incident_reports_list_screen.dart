import 'package:beacon_flutter_mobapp/alerts_list_screen.dart';
import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_report_view_screen.dart';
import 'package:beacon_flutter_mobapp/models/report_status.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/profile_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class IncidentReportsListScreen extends StatefulWidget {
  const IncidentReportsListScreen({Key? key}) : super(key: key);

  @override
  State<IncidentReportsListScreen> createState() => _IncidentReportsListScreenState();
}

class _IncidentReportsListScreenState extends State<IncidentReportsListScreen> {
  List<ReportStatus> reportStatusList = [
    ReportStatus(statusName: 'All', isSelected: true),
    ReportStatus(statusName: 'Approved'),
    ReportStatus(statusName: 'Pending'),
    ReportStatus(statusName: 'Closed'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Image.asset(Images.hamBurgerIcon, color: Colors.black87),
                  const SizedBox(width: 10),
                  const Text('My Reports', style: TextStyle(color: Colors.black87, fontSize: 16)),
                  const Spacer(),
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 0.0,
                    children: List<Widget>.generate(
                      reportStatusList.length,
                      (index) {
                        return ActionChip(
                          label: Text(
                            reportStatusList[index].statusName!,
                            style: TextStyle(
                              color: reportStatusList[index].isSelected! ? Colors.white : Colors.black87,
                            ),
                          ),
                          backgroundColor: reportStatusList[index].isSelected! ? Colors.black87 : Colors.white,
                          side: const BorderSide(color: Colors.grey),
                          elevation: 3,
                          avatar:
                              reportStatusList[index].isSelected! ? const Icon(Icons.check, color: Colors.white) : null,
                          onPressed: () {
                            reportStatusList.forEach((item) => item.isSelected = false);
                            setState(() {
                              reportStatusList[index].isSelected = !reportStatusList[index].isSelected!;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
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
                    title: const Text('PC/FV/12345678', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    subtitle: const Text('Olay Street, Riyadh', style: TextStyle(fontSize: 12)),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const IncidentReportViewScreen();
                      }));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Text('Pending', style: TextStyle(fontSize: 12)),
                        ),
                        const Spacer(),
                        const Text('Last updated on 04 May 2022', style: TextStyle(fontSize: 12)),
                      ],
                    ),
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
          currentIndex: 1,
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
              //case 1: this screen
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
}

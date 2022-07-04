import 'package:beacon_flutter_mobapp/alerts_list_screen.dart';
import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_report_view_actions_screen.dart';
import 'package:beacon_flutter_mobapp/incident_report_view_activity_screen.dart';
import 'package:beacon_flutter_mobapp/incident_report_view_info_screen.dart';
import 'package:beacon_flutter_mobapp/models/report_stages.dart';
import 'package:beacon_flutter_mobapp/models/witness.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/profile_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class IncidentReportViewScreen extends StatefulWidget {
  const IncidentReportViewScreen({Key? key}) : super(key: key);

  @override
  State<IncidentReportViewScreen> createState() => _IncidentReportViewScreenState();
}

class _IncidentReportViewScreenState extends State<IncidentReportViewScreen> {
  final List<ReportStage> reportStageList = [
    ReportStage(stageName: 'Info', isSelected: true),
    ReportStage(stageName: 'Activity'),
    ReportStage(stageName: 'Actions'),
  ];

  final List<Witness> addedWitnessList = [
    Witness(name: 'Hazmat Mohammed', contactNumber: '+966- 123456789', profilePicPath: Images.profilePic1),
    Witness(name: 'Imran Ali', contactNumber: '+966- 987654321', profilePicPath: Images.profilePic2),
    Witness(name: 'Abdul Zafer Hussain', contactNumber: '+966- 574844949', profilePicPath: Images.profilePicDummy),
  ];

  List<Widget>? screens;
  int? pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    screens = [
      IncidentReportViewInfoScreen(addedWitnessList: addedWitnessList),
      IncidentReportViewActivityScreen(),
      const IncidentReportViewActionsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,//this is required to get the status bar icons to be displayed
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  //const SizedBox(width: 15),
                  //Image.asset(Images.backIcon, color: Colors.black87),
                  const BackButton(color: Colors.black87),
                  //const SizedBox(width: 10),
                  const Text('Viewing Report', style: TextStyle(color: Colors.black87, fontSize: 16)),
                  const Spacer(),
                  const Icon(Icons.share_outlined, color: Colors.black87),
                  const SizedBox(width: 15),
                  Image.asset('assets/images/download.png'),
                  const SizedBox(width: 15),
                  const Icon(Icons.more_vert, color: Colors.black87),
                  const SizedBox(width: 15),
                ],
              ),
              //const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 15),
                  Wrap(
                    spacing: 15.0,
                    children: List<Widget>.generate(
                      reportStageList.length,
                      (index) {
                        return ActionChip(
                          label: Text(
                            reportStageList[index].stageName!,
                            style: TextStyle(
                              color: reportStageList[index].isSelected! ? Colors.white : Colors.black87,
                            ),
                          ),
                          backgroundColor: reportStageList[index].isSelected! ? Colors.black87 : Colors.white,
                          side: const BorderSide(color: Colors.grey),
                          elevation: 3,
                          avatar: reportStageList[index].isSelected!
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                          onPressed: () {
                            reportStageList.forEach((item) => item.isSelected = false);
                            setState(() {
                              reportStageList[index].isSelected = !reportStageList[index].isSelected!;
                              pageIndex = index;
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: screens![pageIndex!],
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

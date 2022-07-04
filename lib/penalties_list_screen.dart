import 'package:beacon_flutter_mobapp/alerts_list_screen.dart';
import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/incident_reports_list_screen.dart';
import 'package:beacon_flutter_mobapp/models/penalty_status.dart';
import 'package:beacon_flutter_mobapp/models/penalty_ticket.dart';
import 'package:beacon_flutter_mobapp/notifications_list_screen.dart';
import 'package:beacon_flutter_mobapp/penalty_view_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class PenaltiesListScreen extends StatefulWidget {
  const PenaltiesListScreen({Key? key}) : super(key: key);

  @override
  State<PenaltiesListScreen> createState() => _PenaltiesListScreenState();
}

class _PenaltiesListScreenState extends State<PenaltiesListScreen> {
  final List<PenaltyTicket> penaltyTicketList = [
    PenaltyTicket(
      departmentLogoPath: Images.police,
      departmentName: 'Saudi Motor Vehicle Department',
      chargeAgainstCitizen: 'Over speeding',
      dateTime: '05 Mar 2022 09:30 AM',
      penaltyStatus: PenaltyStatus(statusName: 'Pending', isSelected: true),
      amountToPay: 120,
    ),
    PenaltyTicket(
      departmentLogoPath: Images.water,
      departmentName: 'Saudi Water Authority',
      chargeAgainstCitizen: 'Wasting of Water',
      dateTime: '15 Mar 2022 11:30 AM',
      penaltyStatus: PenaltyStatus(statusName: 'Paid', isSelected: true),
      amountToPay: 325,
    ),
  ];
  final List<PenaltyStatus> penaltyStatusList = [
    PenaltyStatus(statusName: 'All', isSelected: true),
    PenaltyStatus(statusName: 'Paid'),
    PenaltyStatus(statusName: 'Pending'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  const Text('My Penalty Tickets', style: TextStyle(color: Colors.black87, fontSize: 16)),
                  const Spacer(),
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Wrap(
                    spacing: 15.0,
                    runSpacing: 0.0,
                    children: List<Widget>.generate(
                      penaltyStatusList.length,
                      (index) {
                        return ActionChip(
                          label: Text(
                            penaltyStatusList[index].statusName!,
                            style: TextStyle(
                              color: penaltyStatusList[index].isSelected! ? Colors.white : Colors.black87,
                            ),
                          ),
                          backgroundColor:
                              penaltyStatusList[index].isSelected! ? Colors.black87 : Colors.blueGrey.shade50,
                          side: const BorderSide(color: Colors.grey),
                          elevation: 3,
                          avatar: penaltyStatusList[index].isSelected!
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                          onPressed: () {
                            penaltyStatusList.forEach((item) => item.isSelected = false);
                            setState(() {
                              penaltyStatusList[index].isSelected = !penaltyStatusList[index].isSelected!;
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: penaltyTicketList.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(penaltyTicketList[index].departmentLogoPath!, width: 30),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            penaltyTicketList[index].departmentName!,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            penaltyTicketList[index].chargeAgainstCitizen!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(penaltyTicketList[index].dateTime!,
                              style: TextStyle(fontSize: 12, color: Colors.blue.shade200)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          '✓ ${penaltyTicketList[index].penaltyStatus?.statusName}',
                          style: const TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'SAR ${penaltyTicketList[index].amountToPay!}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 20),
                      penaltyTicketList[index].penaltyStatus?.statusName == 'Paid'
                          ? const SizedBox()
                          : Container(
                              height: 30,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Text('PAY NOW', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return const PenaltyViewScreen();
              }));
            },
          );
        },
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

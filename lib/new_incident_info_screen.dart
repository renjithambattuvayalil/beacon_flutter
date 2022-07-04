import 'package:beacon_flutter_mobapp/models/criticality.dart';
import 'package:beacon_flutter_mobapp/models/report_type.dart';
import 'package:beacon_flutter_mobapp/new_incident_authorities_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class NewIncidentInfoScreen extends StatefulWidget {
  const NewIncidentInfoScreen({Key? key}) : super(key: key);

  @override
  State<NewIncidentInfoScreen> createState() => _NewIncidentInfoScreenState();
}

class _NewIncidentInfoScreenState extends State<NewIncidentInfoScreen> {
  final List<ReportType> reportTypeList = [
    ReportType(label: 'Accident'),
    ReportType(label: 'Medical'),
    ReportType(label: 'Complaint'),
    ReportType(label: 'Other'),
  ];

  final List<Criticality> levelOfCriticalityList = [
    Criticality(label: 'Low'),
    Criticality(label: 'Medium'),
    Criticality(label: 'High'),
    Criticality(label: 'Urgent'),
  ];

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
                children: const [
                  //SizedBox(width: 15),
                  //Icon(Icons.arrow_back_rounded, color: Colors.black87),
                  BackButton(color: Colors.black87),
                  //SizedBox(width: 10),
                  Text('Report New Incident', style: TextStyle(color: Colors.black87, fontSize: 16)),
                ],
              ),
              //const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    circleContainer(insideText: '1', isInFocus: true),
                    const Expanded(child: Divider(color: Colors.black87, thickness: 1)),
                    circleContainer(insideText: '2', isInFocus: false),
                    const Expanded(child: Divider(color: Colors.black87, thickness: 1)),
                    circleContainer(insideText: '3', isInFocus: false),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Expanded(child: Text('Incident Info')),
                    Expanded(child: Text('Authorities')),
                    Text('Witnesses'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //type of reporting
              Row(
                children: const [
                  Text('Type of Reporting', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.info_rounded, color: Colors.purple),
                ],
              ),
              Wrap(
                spacing: 25.0,
                runSpacing: 0.0,
                children: List<Widget>.generate(
                  reportTypeList.length,
                  (index) {
                    return ActionChip(
                      label: Text(
                        reportTypeList[index].label!,
                        style: TextStyle(
                          color: reportTypeList[index].isSelected! ? Colors.white : Colors.black87,
                        ),
                      ),
                      backgroundColor: reportTypeList[index].isSelected! ? Colors.black87 : Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      elevation: 3,
                      avatar: reportTypeList[index].isSelected! ? const Icon(Icons.check, color: Colors.white) : null,
                      onPressed: () {
                        reportTypeList.forEach((item) => item.isSelected=false);
                        setState(() {
                          reportTypeList[index].isSelected = !reportTypeList[index].isSelected!;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 15),
              //level of criticality
              Row(
                children: const [
                  Text('Level of Criticality', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.info_rounded, color: Colors.purple),
                ],
              ),
              Wrap(
                spacing: 25.0,
                runSpacing: 0.0,
                children: List<Widget>.generate(
                  levelOfCriticalityList.length,
                      (index) {
                    return ActionChip(
                      label: Text(
                        levelOfCriticalityList[index].label!,
                        style: TextStyle(
                          color: levelOfCriticalityList[index].isSelected! ? Colors.white : Colors.black87,
                        ),
                      ),
                      backgroundColor: levelOfCriticalityList[index].isSelected! ? Colors.black87 : Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      elevation: 3,
                      avatar: levelOfCriticalityList[index].isSelected! ? const Icon(Icons.check, color: Colors.white) : null,
                      onPressed: () {
                        levelOfCriticalityList.forEach((item) => item.isSelected=false);
                        setState(() {
                          levelOfCriticalityList[index].isSelected = !levelOfCriticalityList[index].isSelected!;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 15),
              //photos/videos
              Row(
                children: const [
                  Text('Photos/Videos', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.info_rounded, color: Colors.purple),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/car_pic.png'),
                      Image.asset('assets/images/close_icon.png'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  DottedBorder(
                    color: Colors.blue,
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    dashPattern: const [4],
                    radius: const Radius.circular(30),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/images/plus_blue.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //location of incident in map
              Row(
                children: const [
                  Text('Location of Incident', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.info_rounded, color: Colors.purple),
                ],
              ),
              const SizedBox(height: 5),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/map_pic.png'),
                  Image.asset('assets/images/map_pin.png'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/images/pen.png'),
                  const SizedBox(width: 10),
                  const Text('Change Location', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 30),
              //description about the incident
              Row(
                children: const [
                  Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.info_rounded, color: Colors.purple),
                ],
              ),
              const Text('(Add a Voice Note instead)'),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Add your message here...',
                  suffixIcon: Image.asset('assets/images/mic.png'),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black12),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomSheet: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black87,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: const Text('SAVE & PROCEED →'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const NewIncidentAuthoritiesScreen();
          }));
        },
      ),
    );
  }

  Widget circleContainer({String? insideText, bool? isInFocus}) {
    return Container(
      height: 25,
      width: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isInFocus! ? Colors.black87 : null,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87),
      ),
      child: Text(insideText!, style: TextStyle(color: isInFocus ? Colors.white : null)),
    );
  }
}

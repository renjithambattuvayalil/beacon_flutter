import 'package:beacon_flutter_mobapp/models/authority.dart';
import 'package:beacon_flutter_mobapp/new_incident_witnesses_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class NewIncidentAuthoritiesScreen extends StatefulWidget {
  const NewIncidentAuthoritiesScreen({Key? key}) : super(key: key);

  @override
  State<NewIncidentAuthoritiesScreen> createState() => _NewIncidentAuthoritiesScreenState();
}

class _NewIncidentAuthoritiesScreenState extends State<NewIncidentAuthoritiesScreen> {
  List<Authority> authoritiesList = [
    Authority(departmentName: 'Saudi Police', agencyName: 'National Law & Order Agency', imagePath: Images.police),
    Authority(
        departmentName: 'Saudi National Ambulance',
        agencyName: 'National Health Service Agency',
        imagePath: Images.police),
    Authority(departmentName: 'Saudi Fire Force', agencyName: 'National Law & Order Agency', imagePath: Images.police),
    Authority(
        departmentName: 'Saudi National Hospital Service',
        agencyName: 'National Health Service Agency',
        imagePath: Images.police),
    Authority(
        departmentName: 'Saudi Intelligence', agencyName: 'National Law & Order Agency', imagePath: Images.police),
    Authority(
        departmentName: 'Saudi Public Works Department',
        agencyName: 'National Public Works Agency',
        imagePath: Images.police),
    Authority(
        departmentName: 'Saudi Road Transport Authority',
        agencyName: 'National Road Transport Agency',
        imagePath: Images.police),
    Authority(
        departmentName: 'Saudi Ministry of Interior', agencyName: 'National Ministry Agency', imagePath: Images.police),
    Authority(departmentName: 'Saudi Police', agencyName: 'National Law & Order Agency', imagePath: Images.police),
    Authority(
        departmentName: 'Saudi National Ambulance',
        agencyName: 'National Health Service Agency',
        imagePath: Images.police),
    Authority(departmentName: 'Saudi Fire Force', agencyName: 'National Law & Order Agency', imagePath: Images.police),
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
                    circleContainer(insideText: '1', isSaved: true, isInFocus: false),
                    const Expanded(child: Divider(color: Colors.black87, thickness: 1)),
                    circleContainer(insideText: '2', isSaved: false, isInFocus: true),
                    const Expanded(child: Divider(color: Colors.black87, thickness: 1)),
                    circleContainer(insideText: '3', isSaved: false, isInFocus: false),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Select Authorities to Report', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.info_rounded, color: Colors.grey.shade200),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: authoritiesList.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: authoritiesList[index].isSelected! ? Colors.black87 : null,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 0),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center     ,
                            children: [
                              Transform.scale(
                                scale:1.2,
                                child: Radio(
                                  fillColor: authoritiesList[index].isSelected!
                                      ? MaterialStateColor.resolveWith((states) => Colors.white)
                                      : null,
                                  value: authoritiesList[index].isSelected!,
                                  groupValue: true,
                                  onChanged: (_) {},
                                ),
                              ),
                              Icon(
                                Icons.check,
                                size: 12,
                                color: authoritiesList[index].isSelected! ? Colors.black : Colors.white,
                              ),
                            ],
                          ),
                          Image.asset(authoritiesList[index].imagePath!, width: 30),
                        ],
                      ),
                      title: Text(authoritiesList[index].departmentName!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: authoritiesList[index].isSelected! ? Colors.white : null,
                          )),
                      subtitle: Text(authoritiesList[index].agencyName!,
                          style: TextStyle(
                              fontSize: 12, color: authoritiesList[index].isSelected! ? Colors.white : null)),
                      onTap: () {
                        setState(() {
                          authoritiesList[index].isSelected = !authoritiesList[index].isSelected!;
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 5);
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
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
            return const NewIncidentWitnessesScreen();
          }));
        },
      ),
    );
  }

  Widget circleContainer({String? insideText, bool? isSaved, bool? isInFocus}) {
    return Container(
      height: 25,
      width: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSaved!
            ? Colors.black87
            : isInFocus!
                ? Colors.black87
                : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87),
      ),
      child: isSaved
          ? const Icon(Icons.check, color: Colors.white)
          : Text(
              insideText!,
              style: TextStyle(color: isInFocus! ? Colors.white : Colors.black87),
            ),
    );
  }
}

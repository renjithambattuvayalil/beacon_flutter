import 'package:beacon_flutter_mobapp/models/witness.dart';
import 'package:beacon_flutter_mobapp/new_incident_report_receipt.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class NewIncidentReportReviewScreen extends StatelessWidget {
  NewIncidentReportReviewScreen({Key? key}) : super(key: key);

  final List<Witness> addedWitnessList = [
    Witness(name: 'Hazmat Mohammed', contactNumber: '+966- 123456789', profilePicPath: Images.profilePic1),
    Witness(name: 'Imran Ali', contactNumber: '+966- 987654321', profilePicPath: Images.profilePic2),
    Witness(name: 'Abdul Zafer Hussain', contactNumber: '+966- 574844949', profilePicPath: Images.profilePicDummy),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: const BackButton(color: Colors.black87),
        //iconTheme: const IconThemeData(color: Colors.black87), //the above line will do the same
        title: const Text(
          'Review Your Report',
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('Type of Reporting', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    const Text('Complaint'),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('Level of Criticality', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    const Text('High'),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('Photos/Videos', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/car_pic.png'),
                        const SizedBox(width: 10),
                        Image.asset('assets/images/car_pic2.png'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Text('Location of Incident', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Image.asset('assets/images/map_pic.png'),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    const Text('Description about the incident'),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('Reporting To', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    Wrap(
                      spacing: 20,
                      children: [
                        Chip(
                            label: const Text('Police'),
                            backgroundColor: const Color(0xFFf1f1f1),
                            avatar: Image.asset(Images.police, width: 30)),
                        Chip(
                            label: const Text('Ambulance'),
                            backgroundColor: const Color(0xFFf1f1f1),
                            avatar: Image.asset(Images.police, width: 30)),
                        Chip(
                            label: const Text('Fire Force'),
                            backgroundColor: const Color(0xFFf1f1f1),
                            avatar: Image.asset(Images.police, width: 30)),
                        Chip(
                            label: const Text('Public Works Department'),
                            backgroundColor: const Color(0xFFf1f1f1),
                            avatar: Image.asset(Images.police, width: 30)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('Added Witnesses', style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.edit_outlined, color: Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: addedWitnessList.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          leading: CircleAvatar(backgroundImage: AssetImage(addedWitnessList[index].profilePicPath!)),
                          title: Row(
                            children: [
                              Text(addedWitnessList[index].name!),
                              const SizedBox(width: 5),
                              Image.asset(Images.correct),
                            ],
                          ),
                          subtitle: Text(addedWitnessList[index].contactNumber!),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60), //this is to see the items till end of page
          ],
        ),
      ),
      bottomSheet: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black87,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: const Text('SUBMIT REPORT →'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const NewIncidentReportReceiptScreen();
          }));
        },
      ),
    );
  }
}

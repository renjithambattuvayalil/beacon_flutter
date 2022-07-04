import 'package:beacon_flutter_mobapp/models/witness.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class IncidentReportViewInfoScreen extends StatelessWidget {
  const IncidentReportViewInfoScreen({
    Key? key,
    required this.addedWitnessList,
  }) : super(key: key);

  final List<Witness> addedWitnessList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Receipt No.'),
            const SizedBox(height: 5),
            const Text('PC/FV/1234567', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Type of Reporting', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Complaint'),
            const SizedBox(height: 10),
            const Text('Level of Criticality', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('High'),
            const SizedBox(height: 10),
            const Text('Photos/Videos', style: TextStyle(fontWeight: FontWeight.bold)),
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
            //Container(height: 100),
            const Text('Location of Incident', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            //Container(height: 100),
            Image.asset('assets/images/map_pic.png'),
            const SizedBox(height: 30),
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Description about the incident'),
            const SizedBox(height: 10),
            const Text('Reporting To', style: TextStyle(fontWeight: FontWeight.bold)),
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
            const Text('Added Witnesses', style: TextStyle(fontWeight: FontWeight.bold)),
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
            const SizedBox(height: 30), //this is to see the items till end of page
          ],
        ),
      ),
    );
  }
}

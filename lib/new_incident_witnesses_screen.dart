import 'package:beacon_flutter_mobapp/models/witness.dart';
import 'package:beacon_flutter_mobapp/new_incident_report_receipt.dart';
import 'package:beacon_flutter_mobapp/new_incident_report_review.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class NewIncidentWitnessesScreen extends StatefulWidget {
  const NewIncidentWitnessesScreen({Key? key}) : super(key: key);

  @override
  State<NewIncidentWitnessesScreen> createState() => _NewIncidentWitnessesScreenState();
}

class _NewIncidentWitnessesScreenState extends State<NewIncidentWitnessesScreen> {
  List<Witness> witnessList = [
    Witness(name: 'Hazmat Mohammed', contactNumber: '+966- 123456789', profilePicPath: Images.profilePic1),
    Witness(name: 'Imran Ali', contactNumber: '+966- 987654321', profilePicPath: Images.profilePic2),
    Witness(name: 'Abdul Zafer Hussain', contactNumber: '+966- 574844949', profilePicPath: Images.profilePicDummy),
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
                    circleContainer(insideText: '2', isSaved: true, isInFocus: false),
                    const Expanded(child: Divider(color: Colors.black87, thickness: 1)),
                    circleContainer(insideText: '3', isSaved: false, isInFocus: true),
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
              children: const [
                Text('Add Witnesses(Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.info_rounded, color: Colors.purple),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Here, you can add the witnesses of the incident'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: witnessList.length,
                itemBuilder: (_, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: AssetImage(witnessList[index].profilePicPath!)),
                      title: Row(
                        children: [
                          Text(witnessList[index].name!),
                          const SizedBox(width: 5),
                          Image.asset(Images.correct),
                        ],
                      ),
                      subtitle: Text(witnessList[index].contactNumber!),
                      trailing: const Icon(Icons.more_vert, color: Colors.black87),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size(300, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.blue.shade100),
                ),
              ),
              child: const Text('+ ADD WITNESS', style: TextStyle(color: Colors.black54, fontSize: 18)),
              onPressed: () {},
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          const SizedBox(width: 1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              //in the below line, width/2 -1, because we are giving a width 1 at the beginning of Row
              minimumSize: Size(MediaQuery.of(context).size.width / 2 - 1, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: const BorderSide(color: Colors.black87, width: 2),
              ),
            ),
            child: const Text('SAVE & REVIEW →', style: TextStyle(color: Colors.black87)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return NewIncidentReportReviewScreen();
              }));
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black87,
              //in the below line, width/2 -1, because we are giving a width 1 at the end of Row
              minimumSize: Size(MediaQuery.of(context).size.width / 2 - 1, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
            child: const Text('SUBMIT REPORT →'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return const NewIncidentReportReceiptScreen();
              }));
            },
          ),
          const SizedBox(width: 1),
        ],
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

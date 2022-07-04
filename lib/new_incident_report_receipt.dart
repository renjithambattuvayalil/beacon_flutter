import 'package:beacon_flutter_mobapp/models/witness.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NewIncidentReportReceiptScreen extends StatefulWidget {
  const NewIncidentReportReceiptScreen({Key? key}) : super(key: key);

  @override
  State<NewIncidentReportReceiptScreen> createState() => _NewIncidentReportReceiptScreenState();
}

class _NewIncidentReportReceiptScreenState extends State<NewIncidentReportReceiptScreen> {
  bool? _isLoading = true;
  final List<Witness> addedWitnessList = [
    Witness(name: 'Hazmat Mohammed', contactNumber: '+966- 123456789', profilePicPath: Images.profilePic1),
    Witness(name: 'Imran Ali', contactNumber: '+966- 987654321', profilePicPath: Images.profilePic2),
    Witness(name: 'Abdul Zafer Hussain', contactNumber: '+966- 574844949', profilePicPath: Images.profilePicDummy),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Image.asset(Images.hamBurgerIcon, color: Colors.black87),
        title: const Text('Report Receipt', style: TextStyle(color: Colors.black87, fontSize: 18)),
        actions: [
          const Icon(Icons.share_outlined, color: Colors.black87),
          Image.asset('assets/images/download.png'),
          const Icon(Icons.more_vert, color: Colors.black87),
          const SizedBox(width: 10),
        ],
      ),
      body: _isLoading!
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('Submitting your Report'),
                ],
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedBorder(
                      color: Colors.blue,
                      strokeWidth: 2,
                      borderType: BorderType.RRect,
                      dashPattern: const [4],
                      radius: const Radius.circular(15),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/images/check-mark.png'),
                                  const Text('Report has been successfully submitted',
                                      style: TextStyle(color: Colors.green)),
                                  const SizedBox(height: 10),
                                  const DottedLine(),
                                  const SizedBox(height: 10),
                                  const Text('Receipt No.'),
                                  const SizedBox(height: 5),
                                  const Text('PC/FV/1234567', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  const DottedLine(),
                                ],
                              ),
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
                                    leading: CircleAvatar(
                                        backgroundImage: AssetImage(addedWitnessList[index].profilePicPath!)),
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
      bottomSheet: _isLoading!
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      minimumSize: Size(MediaQuery.of(context).size.width / 2 - 30, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black87, width: 2),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.share_outlined),
                        SizedBox(width: 10),
                        Text('SHARE', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onPressed: () {
                      Share.share('Share Receipt');
                    },
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      minimumSize: Size(MediaQuery.of(context).size.width / 2 - 30, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/download.png', color: Colors.white),
                        const SizedBox(width: 10),
                        const Text('DOWNLOAD'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
    );
  }
}

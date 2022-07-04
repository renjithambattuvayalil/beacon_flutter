import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class PenaltyViewScreen extends StatelessWidget {
  const PenaltyViewScreen({Key? key}) : super(key: key);
  final String sampleDescription =
      'This is an information about your wrong parking on so and so date and place. This is an information about your wrong parking on so and so date and place. This is an information about your wrong parking on so and so date and place. ';
  final String conclusion = 'This is the conclusion line. This is the conclusion line. This is the conclusion line. ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        //leading: Image.asset(Images.backIcon),
        leading: const BackButton(color: Colors.black87),
        titleSpacing: 0,
        title: const Text('View Penalty Ticket', style: TextStyle(color: Colors.black87)),
        actions: [
          Image.asset(Images.download),
          const Icon(Icons.more_vert, color: Colors.black87),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                //shall give the padding for container
                leading: Image.asset(Images.police, width: 50),
                horizontalTitleGap: 5,
                title: const Text('Saudi Motor Vehicle Department', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Ticket No.KSA/TF/87/634223', style: TextStyle(color: Colors.blue, fontSize: 12)),
                    Text('05 Mar 2022 09:30 AM', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Divider(color: Colors.blue.shade100, thickness: 2, indent: 10, endIndent: 10),
              const SizedBox(height: 15),
              const Text('Wrong Parking', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Image.asset('assets/images/wrong_parking.png'),
              const SizedBox(height: 10),
              Text(sampleDescription, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 10),
              Text(conclusion, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 20),
              const Divider(color: Colors.black, thickness: 4, indent: 130, endIndent: 130),
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
        child: const Text('PAY NOW →'),
        onPressed: () {},
      ),
    );
  }
}

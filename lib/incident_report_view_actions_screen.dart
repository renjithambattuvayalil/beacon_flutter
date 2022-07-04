import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class IncidentReportViewActionsScreen extends StatelessWidget {
  const IncidentReportViewActionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Images.viewReport, width: 20),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'You have received tickets for '),
                          TextSpan(
                              text: "'Parking in No Parking Zone'. ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Pay your fine by 01 June,2022 '),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Text('PAY NOW', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                        const Spacer(),
                        const Text('05 Jun 2022 10:15AM'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:beacon_flutter_mobapp/models/report_activity.dart';
import 'package:flutter/material.dart';

class IncidentReportViewActivityScreen extends StatelessWidget {
  IncidentReportViewActivityScreen({Key? key}) : super(key: key);
  final List<ReportActivity> reportActivityList = [
    ReportActivity(
      dateTime: 'Thursday 5 Mar 2022 10:15 AM',
      description: 'Police has assigned your report to personal for further action',
    ),
    ReportActivity(
      dateTime: 'Tuesday 3 Mar 2022 10:10 AM',
      description: 'Police has reviewed your report and approved for further action',
      isCurrentStage: true,
    ),
    ReportActivity(
      dateTime: 'Tuesday 3 Mar 2022 10:00 AM',
      description: 'You have submitted the incident report and it has been received by authorities',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: reportActivityList.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: index == 0 ? const EdgeInsets.only(left: 15, top: 10) : const EdgeInsets.only(left: 15),
          height: index == 0 ? 110 : 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: index == 0
                ? const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                : index == reportActivityList.length - 1
                    ? const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                    : null,
          ),
          child: Row(
            children: [
              Column(
                children: [
                  reportActivityList[index].isCurrentStage! ? circleContainer(isCurrentStage: true) : circleContainer(),
                  index == reportActivityList.length - 1
                      ? const SizedBox()
                      : const SizedBox(
                          height: 75,
                          child: VerticalDivider(color: Colors.black87, thickness: 1),
                        )
                ],
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      reportActivityList[index].dateTime!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(reportActivityList[index].description!),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget circleContainer({bool? isCurrentStage = false}) {
    return Container(
      height: 25,
      width: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87),
      ),
      child: isCurrentStage! ? const Icon(Icons.check) : null,
    );
  }
}

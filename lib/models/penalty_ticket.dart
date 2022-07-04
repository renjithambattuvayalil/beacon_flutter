import 'package:beacon_flutter_mobapp/models/penalty_status.dart';

class PenaltyTicket {
  String? departmentLogoPath;
  String? departmentName;
  String? chargeAgainstCitizen;
  String? dateTime;
  double? amountToPay;
  PenaltyStatus? penaltyStatus;

  PenaltyTicket({
    this.departmentLogoPath,
    this.departmentName,
    this.chargeAgainstCitizen,
    this.dateTime,
    this.amountToPay,
    this.penaltyStatus,
  });
}

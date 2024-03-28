import 'package:his_project/models/doctor/branch_dep_doctor.dart';

class DoctorInfoScreenArgs {
  Doctor d;
  String doctorName;
  String branchName;
  String depName;

  DoctorInfoScreenArgs(
      {required this.d,
      required this.doctorName,
      required this.branchName,
      required this.depName});
}

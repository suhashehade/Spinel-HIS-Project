import 'package:his_project/models/doctor/doctor.dart';

class ClinicBranch {
  String location;
  List<Doctor> doctors;
  
  ClinicBranch({
    required this.location,
    required this.doctors,
  });
}

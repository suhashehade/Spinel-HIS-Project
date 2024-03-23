import 'package:his_project/models/clinic/clinic_branch.dart';

class Clinic {
  String name;
  List<ClinicBranch> barnches = [];

  Clinic({
    required this.name,
    required this.barnches,
  });
}

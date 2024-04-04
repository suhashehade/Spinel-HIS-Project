class DoctorsListArguments {
  int doctorId;
  int depId;
  int branchId;
  String doctorName;
  String branchName;
  String depName;

  DoctorsListArguments({
    required this.branchId,
    required this.depId,
    required this.doctorId,
    required this.doctorName,
    required this.branchName,
    required this.depName,
  });
}

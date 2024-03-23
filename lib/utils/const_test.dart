import 'package:his_project/models/clinic/clinic.dart';
import 'package:his_project/models/clinic/clinic_branch.dart';
import 'package:his_project/models/doctor/doctor.dart';

class TestConst {
  static List<Clinic> clinicList = [
    Clinic(name: "clinic 1", barnches: [
      ClinicBranch(location: 'Nablus', doctors: [
        Doctor(
            name: "Ahmad",
            title: "title",
            image:
                'https://unsplash.com/photos/a-man-wearing-glasses-and-a-black-shirt-iEEBWgY_6lA'),
        Doctor(
            name: "Sara",
            title: "title",
            image:
                'https://unsplash.com/photos/closeup-photography-of-woman-smiling-mEZ3PoFGs_k')
      ]),
      ClinicBranch(location: 'Ramallah', doctors: [
        Doctor(
            name: "Lana",
            title: "title",
            image:
                "https://unsplash.com/photos/shallow-focus-photography-of-woman-outdoor-during-day-rDEOVtE7vOs")
      ]),
      ClinicBranch(location: 'Jenin', doctors: [
        Doctor(
            name: "Mohammed",
            title: "title",
            image:
                "https://unsplash.com/photos/man-standing-beside-wall-pAtA8xe_iVM"),
        Doctor(
            name: "Karam",
            title: "title",
            image:
                "https://unsplash.com/photos/man-standing-beside-wall-pAtA8xe_iVM"),
      ]),
      ClinicBranch(location: 'Salfeet', doctors: [
        Doctor(
            name: "Aseel",
            title: "title",
            image:
                "https://unsplash.com/photos/smiling-woman-in-shallow-focus-photography-_H6wpor9mjs")
      ]),
    ]),
    Clinic(name: "clinic 2", barnches: [
      ClinicBranch(location: 'Nablus', doctors: [
        Doctor(
            name: "Samer",
            title: "title",
            image:
                "https://unsplash.com/photos/man-wearing-black-notched-lapel-suit-jacket-in-focus-photography-WMD64tMfc4k"),
      ]),
      ClinicBranch(location: 'Ramallah', doctors: []),
    ]),
    Clinic(name: "clinic 3", barnches: [
      ClinicBranch(location: 'Nablus', doctors: []),
      ClinicBranch(location: 'Ramallah', doctors: []),
      ClinicBranch(location: 'Tulkarm', doctors: []),
    ]),
    Clinic(name: "clinic 4", barnches: [
      ClinicBranch(location: 'Nablus', doctors: []),
    ]),
  ];
}

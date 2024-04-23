import 'package:his_project/utils/consts_res.dart';

class Urls {
  static String account = "${ConstRes.baseUrl}/Account/";
  static String management = '${ConstRes.baseUrl}/Management/';
  static String lkps = "${ConstRes.baseUrl}/AutoComplete/Lookups?";
  static String logicUrl = '${ConstRes.baseUrl}/HISLogic/';
  static String getClinics =
      "${management}DepartmentsList?Page=1&PageSize=1000";
  static String getBranches = "${lkps}categoryCode=Branches&DepartmentId";
  static String getAvailableAppointments =
      "${logicUrl}DoctorAvailableAppointmentsQuery";
  static String getDoctors = "${lkps}categoryCode=UserBasedType&";
  static String getDoctorInfo = "${account}DoctorViewDetails?";
  static String getAvailableAppointmentsDays =
      "${logicUrl}DoctorAvailableAppointmentsList?";
  static String addAppointment = "${Urls.logicUrl}AddAppointment";
  static String login = "${account}OtherLogin";
  static String patientAppointments =
      "${logicUrl}AppointmentsList?Page=1&PageSize=1000&";
  static String appointmentViewDetails = "${logicUrl}AppointmentViewDetails?";
  static String patientDetails =
      '${account}UserList?page=1&pageSize=1000&UserType=3';
  static String doctorDetails =
      '${account}UserList?page=1&pageSize=1000&UserType=2';
}

// http://192.236.146.134:9000/api/Account/UserList?page=1&pageSize=1000&UserType=2
 
 /*
   {
      "id": 18,
      "manualUserId": null,
      "nameEn": "Doctor01   Doctor01",
      "nameAr": "دانة هاني عبد عكر",
      "profilePic": null,
      "phone1": "0599",
      "tel1": null,
      "addressEn": null,
      "addressAr": null,
      "email": null,
      "website": null,
      "isActive": false,
      "idNumber": null,
      "userType": 2,
      "birthDate": null
    },
  */
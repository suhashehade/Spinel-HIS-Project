import 'package:get/get.dart';

class FamilyMedicalFileScreenController extends GetxController {
  RxDouble allowedPeopleListHeight = 100.0.obs;
  RxDouble sentRequestsListHeight = 100.0.obs;
  RxDouble allowedPendingListHeight = 100.0.obs;
  RxBool isPersonsCollaps = false.obs;
  RxBool isMessagesRequestsCollaps = false.obs;
  RxBool isContactsListCollaps = false.obs;

  togglePendingPeopleCollaps() {}
  toggleSentRequestsCollaps() {}
  toggleAllowedPeopleCollaps() {}

  onAllowedPeopleListClick() {}

  onSentRequestsListClick() {}

  onPendingPeopleListClick() {}

  handleReturn(){
    Get.back();
  }
}

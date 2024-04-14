import 'package:get/get.dart';
import 'package:his_project/utils/pages_names.dart';

class HomeScreenController extends GetxController{


   goToAllServices(){
      Get.toNamed(PagesNames.allEServices);
   }
  
}
// // main

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_tutorial/locale/locale_controller.dart';
// import 'package:getx_tutorial/locale/myLocale.dart';
// import 'package:getx_tutorial/services/settingsServices.dart';
// import 'package:getx_tutorial/theme/themeController.dart';
// // import 'package:getx_tutorial/services/myBinding.dart';
// import 'package:getx_tutorial/view/home.dart';
// import 'package:getx_tutorial/view/pageFive.dart';
// import 'package:getx_tutorial/view/pageTwo.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences? sharedPref;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   sharedPref = await SharedPreferences.getInstance();
//   await initialServices();
//   MyLocaleController controller = Get.put(MyLocaleController());
//   ThemeController themeController = Get.put(ThemeController());
//   runApp(GetMaterialApp(
//     // initialBinding: MyBinding(),
//     theme: themeController.initialTheme,
//     locale: controller.initialLang,
//     translations: MyLocal(),
//     initialRoute: '/home',
//     getPages: [
//       GetPage(name: '/home', page: () => Home()),
//       GetPage(name: '/pageTwo', page: () => PageTwo()),
//       GetPage(name: '/pageFive', page: () => const PageFive()),
//     ],
//   ));
// }

// Future initialServices() async {
//   await Get.putAsync(() => SettingServices().init());
// }




// // controller
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_tutorial/main.dart';

// class MyLocaleController extends GetxController {
//   Locale initialLang = sharedPref!.getString('lang') == 'ar'
//       ? const Locale('ar')
//       : sharedPref!.getString('lang') == 'en'
//           ? const Locale('en')
//           : const Locale('es');
//   void changeLang(String codeLang) {
//     Locale locale = Locale(codeLang);
//     sharedPref!.setString('lang', codeLang);
//     Get.updateLocale(locale);
//   }
// }



// // view
// MyLocaleController myLocaleController = Get.find();
//  // btn
// controller.changeLang('en');
















































// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: MySinglePageApp(),
//     );
//   }
// }

// class MySinglePageApp extends StatelessWidget {
//   final RxInt _selectedIndex = 0.obs;

//   final List<Widget> _pages = [
//     PageOne(),
//     PageTwo(),
//     PageThree(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Single Page Application'),
//       ),
//       body: Obx(() => _pages[_selectedIndex.value]),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Page 1',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Page 2',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Page 3',
//           ),
//         ],
//         currentIndex: _selectedIndex.value,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     _selectedIndex.value = index;
//   }
// }

// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page One Content'),
//     );
//   }
// }

// class PageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page Two Content'),
//     );
//   }
// }

// class PageThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page Three Content'),
//     );
//   }
// }

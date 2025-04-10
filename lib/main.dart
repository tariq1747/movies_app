import 'package:dummy_project/core/services/connectivity_service.dart';
import 'package:dummy_project/presentation/controllers/home_bindings.dart';
import 'package:dummy_project/presentation/pages/home_page.dart';
import 'package:dummy_project/presentation/pages/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectivityService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialBinding: HomeBindings(),
      initialRoute: Routes.homePage,
      getPages: [
        GetPage(
          name: Routes.homePage,
          page: () => HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(name: Routes.detailsPage, page: () => MovieDetailPage()),
      ],
    );
  }
}

abstract class Routes {
  static const String homePage = '/';
  static const String detailsPage = '/details';
}

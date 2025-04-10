import 'package:dummy_project/data/remote/api_call.dart';
import 'package:dummy_project/data/repositories/home_repository.dart';
import 'package:get/instance_manager.dart';

import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        homeRepository: Get.put(HomeRepository(apiClient: Get.put(ApiCall()))),
      ),
    );
  }
}

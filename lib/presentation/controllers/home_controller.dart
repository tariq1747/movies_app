import 'dart:developer';

import 'package:dummy_project/data/models/movies_list_module.dart';
import 'package:dummy_project/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:palette_generator/palette_generator.dart';

class HomeController extends GetxController {
  HomeController({required this.homeRepository});
  final HomeRepository homeRepository;
  RxList<Result> moviesList = <Result>[].obs;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  Rx<Color?>? color = Colors.red[400]?.obs;

  @override
  void onInit() {
    super.onInit();
    getMoviesList();
  }

  Future<Color?> getDominantColor(String imageUrl) async {
    final imageProvider = NetworkImage(imageUrl);
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );

    color?.value = paletteGenerator.dominantColor?.color;

    return paletteGenerator.dominantColor?.color;
  }

  void getMoviesList() async {
    isLoading.value = true;
    isError.value = false;
    try {
      var res = await homeRepository.fetchData();

      moviesList.addAll(res.results);
    } catch (e) {
      log('Error: $e');
      isError.value = true;
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }
}

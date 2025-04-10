import 'package:dummy_project/core/constants/apiend_point.dart';
import 'package:dummy_project/main.dart';
import 'package:dummy_project/presentation/controllers/home_controller.dart';
import 'package:dummy_project/presentation/widgets/error_widget.dart';
import 'package:dummy_project/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.red[400], // Match the shade from the image
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Handle drawer or navigation
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Handle more actions
            },
          ),
        ],
      ),
      body: Obx(() {
        return homeController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : homeController.isError.value
            ? CustomErrorWidget(
              onPressed: () {
                homeController.getMoviesList();
              },
            )
            : GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 2 / 3.8,
              ),
              itemCount: homeController.moviesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.detailsPage,
                      arguments: {'movie': homeController.moviesList[index]},
                    );
                  },
                  child: MovieCard(
                    titleParts: homeController.moviesList[index].title,
                    subtitle: homeController.moviesList[index].overview,
                    imagePath:
                        '${ApiConstants.imageUrl}${homeController.moviesList[index].posterPath}',
                  ),
                );
              },
            );
      }),
    );
  }
}

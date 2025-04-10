import 'package:dummy_project/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final String titleParts;
  final String subtitle;
  final String imagePath;

  const MovieCard({
    super.key,
    required this.titleParts,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      initState: (state) async {
        final homeController = Get.find<HomeController>();
        await homeController.getDominantColor(imagePath);
      },
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.network(imagePath)),
            Container(
              color: controller.color?.value ?? Colors.red[400],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleParts,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.favorite, color: Colors.red, size: 20),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

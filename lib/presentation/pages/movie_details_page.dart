import 'package:dummy_project/core/constants/apiend_point.dart';
import 'package:dummy_project/core/utils/utils.dart';
import 'package:dummy_project/data/models/movies_list_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({super.key});

  final Result? moviedetails = Get.arguments['movie'] as Result?;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  '${ApiConstants.imageUrl}${moviedetails?.backdropPath}', // replace with real image asset if needed
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 170, height: 150),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${moviedetails?.title}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              moviedetails?.releaseDate
                                      .toString()
                                      .toMonthYearFormat() ??
                                  '',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Average rating: ${moviedetails?.voteAverage}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '${moviedetails?.overview}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const Divider(height: 1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Trailers',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Icon(Icons.share, color: Colors.white),
            ),
            Positioned(
              height: 250,
              left: Get.width * 0.5,
              child: Icon(
                Icons.play_circle_fill,
                size: 60,
                color: Colors.white,
              ),
            ),

            Positioned(
              top: 200,
              left: 16,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${moviedetails?.posterPath}', // replace with local asset if needed
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

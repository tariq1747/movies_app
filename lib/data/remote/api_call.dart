import 'dart:developer';
import 'package:dummy_project/core/constants/apiend_point.dart';
import 'package:dummy_project/core/services/connectivity_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  final ConnectivityService _connectivityService =
      Get.find<ConnectivityService>();

  final Map<String, String> header = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNzIyZjU0ODlmMTg0ZjRkODRmNjJlOWM3OGEzMDVmMyIsIm5iZiI6MTc0NDEyOTU2Mi42NjMsInN1YiI6IjY3ZjU0ZTFhOGNmY2NmN2JhZmQ5ODdkZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zK7lMXppTaaUatJTcgpK7mgpqZ_niOKPpgsrv9JgMVk',
  };

  Future<http.Response> getMoviesList() async {
    if (!_connectivityService.hasConnection) {
      throw Exception('No internet connection');
    }

    try {
      var uri = Uri.parse(ApiConstants.getMoviesurl);
      final response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        log('Response: ${response.body}');
        return response;
      } else {
        throw Exception('Failed to load movies list: ${response.statusCode}');
      }
    } catch (e) {
      log('API Error: $e');
      rethrow;
    }
  }
}

import 'package:dummy_project/data/models/movies_list_module.dart';
import 'package:dummy_project/data/remote/api_call.dart';

class HomeRepository {
  HomeRepository({required this.apiClient});
  final ApiCall apiClient;
  Future<MoviesListModule> fetchData() async {
    try {
      var res = await apiClient.getMoviesList();
      return MoviesListModule.fromRawJson(res.body);
    } catch (e) {
      rethrow;
    }
  }
}

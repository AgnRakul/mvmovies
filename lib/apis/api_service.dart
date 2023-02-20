import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvmovies/model/mv_model.dart';
import 'package:http/http.dart' as http;


final apiProvider = Provider<APIService>((ref) => APIService());

class APIService {
  static const _baseUrl =
      'https://mvmovies-app-server-production.up.railway.app/';

  Future<List<MvModel>> fetchRequestedMovie(mv) async {
    try {
      final response =
          await http.get(Uri.parse("${_baseUrl}/movies/search?mv=${mv}"));
      if (response.statusCode == 200) {
        final mvModel = mvModelFromJson(response.body);
        return mvModel;
      } else {
        throw Exception("Issues");
      }
    } catch (e) {
      throw Exception('Failed ${e}');
    }
  }
}



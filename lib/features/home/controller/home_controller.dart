import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvmovies/apis/api_service.dart';
import 'package:mvmovies/model/mv_model.dart';

final homeController = StateNotifierProvider<HomeController, bool>((ref) {
  return HomeController(apiService: ref.watch(apiProvider));
});

class HomeController extends StateNotifier<bool> {
  final APIService _apiService;
  HomeController({required APIService apiService})
      : _apiService = apiService,
        super(false);

  List<MvModel> mvData = [];

  void fetchMovies(mv) async {
    state = true;
    final res = await _apiService.fetchRequestedMovie(mv);
    if (res.isEmpty) {
      mvData = res;
      state = false;
    } else {
      mvData = [];
      state = false;
    }
  }
}



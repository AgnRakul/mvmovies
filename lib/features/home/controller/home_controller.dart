import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvmovies/apis/api_service.dart';

final homeController = StateNotifierProvider<HomeController, bool>((ref) {
  return HomeController(apiService: ref.watch(apiProvider));
});

class HomeController extends StateNotifier<bool> {
  final APIService _apiService;
  HomeController({required APIService apiService})
      : _apiService = apiService,
        super(false);

  fetchMovies(mv) async {
    state = true;
    try {
      final res = await _apiService.fetchRequestedMovie(mv);
      state = false;
      log(res[0].shortName.toString());
      return res;
    } catch (e) {
      state = false;
      log(e.toString());
    }
  }
}

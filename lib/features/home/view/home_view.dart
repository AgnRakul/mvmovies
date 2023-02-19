import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvmovies/constant/pallete.dart';

import '../controller/home_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final searchMoviesController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchMoviesController.dispose();
  }

  void onFetchMovies() {
    ref.read(homeController.notifier).fetchMovies(searchMoviesController.text);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(homeController);

    return Scaffold(
      backgroundColor: ColorPallete.AppColor,
      appBar: AppBar(
        backgroundColor: ColorPallete.AppColor,
        elevation: 0,
        title: Text("Mv Movies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: searchMoviesController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search Movies...',
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: onFetchMovies,
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Latest Movies",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 91,
                          decoration: BoxDecoration(
                            color: ColorPallete.CardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            searchMoviesController.text,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

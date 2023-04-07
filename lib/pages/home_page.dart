import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:movie_db/widgets/poster_title.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

import '../widgets/description.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Result> allMovies = [];

  Future getMovies() async {
    var response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=c90ff632dd9b6988b899992d54e81c4d&language=en-US&page=1"));
    List<dynamic> data =
        (jsonDecode(response.body) as Map<String, dynamic>)["results"];
    for (var element in data) {
      allMovies.add(
        Result.fromJson(element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 33, 0, 98),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 33, 0, 98),
        elevation: 0,
        title: const Text("Movie DB"),
      ),
      body: FutureBuilder(
          future: getMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading..."),
              );
            } else {
              return GridView.builder(
                itemCount: allMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.7),
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // POSTER & TITLE
                        PosterTitle(
                            originalTitle:
                                allMovies[index].originalTitle.toString(),
                            posterPath:
                                "https://image.tmdb.org/t/p/original/${allMovies[index].posterPath}"),
                        // DESCRIPTION
                        Description(
                          overview: allMovies[index].overview.toString(),
                          voteAverage: "${allMovies[index].voteAverage}",
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}

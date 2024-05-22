import 'package:flutter/material.dart';

import 'package:sevenday/widgets/movies/categories_list.dart';
import 'package:sevenday/widgets/movies/latest_movie.dart';
import 'package:sevenday/widgets/movies/trending_movie.dart';

class HomeMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // List<int> movieList = [1,2,3,4,5,6];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrendingMovies(),
              CategoriesList(),
              LatestMovies()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/movie_model.dart';

class MovieSuggestions extends StatefulWidget {
  final List<MovieModel> movieList;

  const MovieSuggestions({Key? key, required this.movieList}) : super(key: key);

  @override
  State<MovieSuggestions> createState() => _MovieSuggestionsState();
}

class _MovieSuggestionsState extends State<MovieSuggestions> {

  @override
  void initState(){
    super.initState();
    print('prints at first');
    // Provider.of<MovieProvider>(context, listen: false).loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    // List<MovieModel> movieList = Provider.of<MovieProvider>(context).movies;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Similar Movies'),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieTitle(movie: widget.movieList[index]);
            },
          ),
        ],
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  final MovieModel movie;

  const MovieTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      // Add other properties to show movie details
    );
  }
}

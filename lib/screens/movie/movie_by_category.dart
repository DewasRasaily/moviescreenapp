import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie_model.dart';
import '../../providers/movie_provider.dart';
import 'package:http/http.dart' as http;

class MoviesByCategoryScreen extends StatefulWidget {
  final String category;
  const MoviesByCategoryScreen({super.key, required this.category});


  @override
  State<MoviesByCategoryScreen> createState() => _MoviesByCategoryScreenState();
}

class _MoviesByCategoryScreenState extends State<MoviesByCategoryScreen> {
  List<MovieModel> movieList = [];


  @override
  void initState(){
    super.initState();
    loadMovieByCategory();
  }

  Future<void> loadMovieByCategory() async{
      final res = await http.get(Uri.parse("https://yts.mx/api/v2/list_movies.json?genre="+ widget.category));
      print(jsonDecode(res.body)['data']['movies']);
      List<MovieModel> temp = [];

      for(final movie in jsonDecode(res.body)['data']['movies']){
        temp.add(MovieModel.fromJson(movie));
      }

      setState(() {
        movieList = temp;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Container(
        child: movieList.length == 0 ? Center(
          child: Text('No movies available for this category'),
        ):ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(movieList[index].title, ),
                // subtitle: Text(movieList[index].year.toString(), style: TextStyle(
                subtitle: Text(
                  movieList[index].year.toString(),
                  style: TextStyle(),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    movieList[index].img,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: Text(
                  movieList[index].rating.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              );
            }),
      ),
    );
  }
}

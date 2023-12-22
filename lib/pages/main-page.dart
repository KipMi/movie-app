import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts_2072006/models/movie-detail.dart';
import 'package:uts_2072006/models/movie.dart';
import 'package:uts_2072006/services/movie-service.dart';
import 'package:uts_2072006/widgets/movie-card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Movie? movi;
  MovieDetail? mdtl;

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthData = MediaQuery.of(context).size.width;
    double heightData = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthData,
              height: heightData * 0.35,
              decoration: BoxDecoration(color: Colors.purple.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Movie Search Engine',
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                  SizedBox(
                    width: widthData * 0.9,
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: widthData * 0.9,
                    child: ElevatedButton(
                      onPressed: () async {
                        Movie? result = await MovieService.getMovieByKeyword(
                            textController.text);

                        if (result != null) {
                          setState(() {
                            movi = result;
                          });
                        }
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.purple),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: widthData,
              height: heightData * 0.65,
              child: Column(
                children: [
                  // FutureBuilder(
                  //   future: MovieService.getMovieByKeyword('john'),
                  //   builder: (context, snapshot) {
                  //     return Text(snapshot.data != null ? snapshot.data!.title : "nope");
                  // })
                  MovieCard(
                    movis: movi != null
                        ? movi
                        : Movie(
                            imdb_id: 'no data',
                            year: 0,
                            actors: 'no data',
                            title: 'no data',
                            keyword: 'none'),
                    mdtl: mdtl != null
                        ? mdtl
                        : MovieDetail(
                            id: "no data",
                            image: "no data",
                            description: 'no data'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

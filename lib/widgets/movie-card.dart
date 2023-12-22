import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts_2072006/models/movie-detail.dart';
import 'package:uts_2072006/models/movie.dart';
import 'package:uts_2072006/pages/details-page.dart';

class MovieCard extends StatelessWidget {
  Movie? movis;
  MovieDetail? mdtl;
  MovieCard({required this.movis, required this.mdtl, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(movi: movis, mdtl: mdtl,)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: Card(
          child: Text(
            movis!.title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

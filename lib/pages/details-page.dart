import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts_2072006/models/movie-detail.dart';
import 'package:uts_2072006/models/movie.dart';
import 'package:uts_2072006/services/movie-service.dart';

class DetailsPage extends StatefulWidget {
  Movie? movi;
  MovieDetail? mdtl;
  DetailsPage({required this.movi, required this.mdtl, super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double widthData = MediaQuery.of(context).size.width;
    double heightData = MediaQuery.of(context).size.height;
    MovieDetail? mdtl;
    return Scaffold(
      appBar: AppBar(title: Text(widget.movi != null ? widget.movi!.title : 'no data')),
      body: Container(
        width: widthData,
        height: heightData,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(mdtl != null ? mdtl.description : 'no data'),
          ],
        )),
    );
  }
}
import 'package:flutter/material.dart';

class PosterTitle extends StatelessWidget {
  PosterTitle(
      {super.key, required this.posterPath, required this.originalTitle});

  String originalTitle;
  String posterPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
        image: DecorationImage(
            image: NetworkImage(posterPath),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              originalTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description({super.key, required this.overview, required this.voteAverage});

  String voteAverage;
  String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.star,
                color: Colors.red,
                size: 15,
              ),
              Text(
                voteAverage,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            overview,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}

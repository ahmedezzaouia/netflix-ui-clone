import 'package:flutter/material.dart';

import '../models/models.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key key,
    @required this.title,
    @required this.contentList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: content.color, width: 3.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black87,
                          Colors.black45,
                          Colors.transparent
                        ],
                        stops: [0, 0.25, 1],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: content.color, width: 4.0),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: 60,
                      height: 50,
                      child: Image.asset(content.titleImageUrl),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

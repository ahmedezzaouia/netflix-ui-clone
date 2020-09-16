import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: Container(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                label: 'List',
                icon: Icons.add,
                onTap: () => print('list'),
              ),
              _PlayButton(),
              VerticalIconButton(
                label: 'Info',
                icon: Icons.info_outline,
                onTap: () => print('info'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: const EdgeInsets.fromLTRB(15, 5.0, 20, 5.0),
      color: Colors.white,
      icon: Icon(
        Icons.play_arrow,
        size: 30.0,
      ),
      onPressed: () {},
      label: Text(
        'Play',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffSet;

  const CustomAppBar({
    Key key,
    this.scrollOffSet = 0.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffSet / 350).clamp(0, 1).toDouble()),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _AppBarButton(
                    onTap: () => print('Tv Shows'),
                    title: 'TV Show',
                  ),
                  _AppBarButton(
                    onTap: () => print('Movies'),
                    title: 'Movies',
                  ),
                  _AppBarButton(
                    onTap: () => print('My List'),
                    title: 'My List',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

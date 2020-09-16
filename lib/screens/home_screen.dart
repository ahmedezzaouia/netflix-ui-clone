import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/cubits/app_bar/app_bar_cubits.dart';

import '../data/data.dart';
import '../widgets/widgets.dart';

import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('cats'),
        child: Icon(Icons.cast),
        backgroundColor: Colors.grey[850],
      ),
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 50),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffSet) {
            return CustomAppBar(
              scrollOffSet: scrollOffSet,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('mylist'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Netflix originals',
              contentList: myList,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('Treading '),
                title: 'Trending',
                contentList: myList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

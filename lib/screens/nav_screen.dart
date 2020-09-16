import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';

class NavScreens extends StatefulWidget {
  @override
  _NavScreensState createState() => _NavScreensState();
}

class _NavScreensState extends State<NavScreens> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming soon ': Icons.queue_play_next,
    'File Download': Icons.file_download,
    'More': Icons.menu,
  };

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body: BlocProvider(
          create: (_) => AppBarCubit(),
          child: _screens[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 11.0,
          selectedFontSize: 11.0,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _icons
              .map(
                (title, icon) {
                  return MapEntry(
                    title,
                    BottomNavigationBarItem(
                      icon: Icon(
                        icon,
                        size: 30.0,
                      ),
                      title: Text(title),
                    ),
                  );
                },
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}

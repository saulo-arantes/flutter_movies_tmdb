import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/movies_page.dart';
import 'package:movies/pages/search_page.dart';
import 'package:movies/pages/tv_shows_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    const TvShowsPage(),
    const MoviesPage(),
    const SearchPage(),
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: 50,
          width: double.infinity,
          child: Image.asset('assets/img/tmdb_blue_long.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          SizedBox(
            width: 40,
            child: Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white)
              ),
              position: BadgePosition.bottomStart(
                bottom: 5,
                start: 5
              ),
              badgeColor: const Color.fromARGB(255, 1, 180, 228),
              child: Icon(
                Icons.favorite_rounded,
                size: 32,
                color: Colors.redAccent.shade400
              ),
            )
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: _selectedIndex,
        elevation: 0,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color.fromARGB(255, 1, 180, 228),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Séries'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Filmes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar'
          ),
        ],
      ),
      body: _tabs.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
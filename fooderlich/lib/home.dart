import 'package:flutter/material.dart';
import 'components/custom_search_delgates.dart';
import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';
import 'screens/grocery_screen.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
    Search()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Fooderlich',
                style: Theme.of(context).textTheme.headline6)),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'Recipes'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'To Buy'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search')
            ]));
  }
}

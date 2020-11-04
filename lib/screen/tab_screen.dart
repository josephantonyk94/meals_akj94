import 'package:flutter/material.dart';
import 'package:meals_app_akj94/screen/favourites.dart';
import 'package:meals_app_akj94/widget/main_drawer.dart';

import 'catagories.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 final List<Map<String, Object>> _pages = [{'pages':Categories(),'title':'Categories'},{'pages' : Favourites(),'title':'Favourites'}];
  int _selectedPageindex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageindex]['title']),
      ),
      body: _pages[_selectedPageindex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageindex,
       // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites'))
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

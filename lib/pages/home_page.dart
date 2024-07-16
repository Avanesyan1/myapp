import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedindex = 0;
  PageController _pageController = PageController();


  void _onItemTapped(int index){
    setState(() {
      _selectedindex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 150),curve: Curves.linear);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _selectedindex = value;
          });
        },
        children: [
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedindex,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor
          ),
        ],
      ),
    );
  }
}




  
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/counter_widget.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CounterWidget(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 80, color: AppConstants.primaryColor),
          SizedBox(height: 16),
          Text('Forest Explorer Profile', 
               style: TextStyle(fontSize: 24, color: AppConstants.earthBrown)),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 80, color: AppConstants.mossGreen),
          SizedBox(height: 16),
          Text('Nature Settings', 
               style: TextStyle(fontSize: 24, color: AppConstants.earthBrown)),
        ],
      ),
    ),
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
        title: const Text(AppConstants.appName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Implement menu functionality
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: AnimatedSwitcher(
        duration: AppConstants.animationDuration,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forest),
            label: 'Forest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_people),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco),
            label: 'Nature',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppConstants.primaryColor,
        unselectedItemColor: AppConstants.earthBrown,
        backgroundColor: const Color(0xFFF1F8E9),
        onTap: _onItemTapped,
      ),
    );
  }
}

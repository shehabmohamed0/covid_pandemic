import 'package:covid_pandemic/core/constants/palette.dart';
import 'package:covid_pandemic/presentation/screens/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';

import '../health/health_screen.dart';
import '../home/home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    const HomeScreen(),
    StatsScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  int _currentIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Palette.primaryColor,
          //other styles
        ),
        child: Drawer(
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              ListTile(
                tileColor: Colors.white,
                title: const Text(
                  'Health Articles',
                  style: TextStyle(),
                ),
                subtitle: const Text(''),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => HealthScreen()));
                },
              ),
              ListTile(
                tileColor: Colors.white,
                title: const Text(
                  'Logout',
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [
          Icons.home,
          Icons.insert_chart,
          Icons.event_note,
          Icons.info,
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}

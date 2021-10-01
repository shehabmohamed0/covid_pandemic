import 'package:covid_pandemic/auth%20module/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:covid_pandemic/config/palette.dart';
import 'package:covid_pandemic/presentation/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'health_screen.dart';
import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
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
                onTap: () {
                  BlocProvider.of<SignInCubit>(context).signOut();
                },
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

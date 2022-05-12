import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:employee/screens/maps_screen.dart';
import 'package:employee/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _onselectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _onselectedIndex = index;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ProfileScreen(),
              ),
              MapsScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: true,
        selectedIndex: _onselectedIndex,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        items: [
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            title: Text(
              'Profile',
            ),
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.locationArrow),
            title: Text(
              'Maps',
            ),
          )
        ],
        onItemSelected: (index) => setState(() {
          _onselectedIndex = index;
          _pageController.jumpToPage(index);
        }),
      ),
    );
  }
}

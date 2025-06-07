import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/events_screen.dart';
import '../screens/clubs_screen.dart';
import '../screens/rewards_screen.dart';
import '../screens/profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => _navigateToPage(context, index),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_rounded),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_rounded),
              label: 'Clubs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_rounded),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    if (index == currentIndex) return;
    
    final routes = [
      HomeScreen.routeName,
      EventsScreen.routeName,
      ClubsScreen.routeName,
      RewardsScreen.routeName,
      ProfileScreen.routeName,
    ];

    Widget page;
    switch (index) {
      case 0:
        // Get token from the current page
        String? token;
        if (ModalRoute.of(context)?.settings.arguments != null) {
          token = (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>)['token'] as String?;
        }
        page = HomeScreen(token: token ?? '');
        break;
      case 1:
        page = EventsScreen();
        break;
      case 2:
        page = ClubsScreen();
        break;
      case 3:
        page = RewardsScreen();
        break;
      case 4:
        page = ProfileScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: routes[index]),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/eco_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample profile data (this would come from API in a real app)
  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";
  final int ecoPoints = 150;
  final int totalActivities = 7;
  final int totalClubs = 2;

  // Sample clubs data
  final List<Map<String, dynamic>> clubs = [
    {
      "name": "NSS",
      "fullName": "National Service Scheme",
      "color": Colors.green,
      "role": "Member",
      "joinedDate": "Jan 2025",
    },
    {
      "name": "Rotaract",
      "fullName": "Rotary Action",
      "color": Colors.blue,
      "role": "Volunteer",
      "joinedDate": "Mar 2025",
    },
  ];

  // Sample activities data
  final List<Map<String, dynamic>> activities = [
    {
      "title": "Green Sunday",
      "organization": "NSS",
      "date": "14 May 2025",
      "points": 30,
      "icon": Icons.park,
    },
    {
      "title": "Cleanathon Week",
      "organization": "Rotaract",
      "date": "5 May 2025",
      "points": 45,
      "icon": Icons.cleaning_services,
    },
    {
      "title": "Workshop Attendance",
      "organization": "Eco Tech Club",
      "date": "20 Apr 2025",
      "points": 20,
      "icon": Icons.school,
    },
    {
      "title": "Tree Plantation Drive",
      "organization": "NSS",
      "date": "12 Apr 2025",
      "points": 35,
      "icon": Icons.forest,
    },
    {
      "title": "River Cleanup",
      "organization": "Rotaract",
      "date": "1 Apr 2025",
      "points": 40,
      "icon": Icons.water,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            EcoAppBar(title: "My Profile"),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      // Profile header section
                      _buildProfileHeader(),
                      SizedBox(height: 30),

                      // Stats section
                      _buildStatsSection(),
                      SizedBox(height: 30),

                      // Clubs section
                      _buildSectionHeader("My Clubs"),
                      SizedBox(height: 15),
                      _buildClubsList(),
                      SizedBox(height: 30),

                      // Recent activities section
                      _buildSectionHeader("My Activities"),
                      SizedBox(height: 15),
                      _buildActivitiesList(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavigation(currentIndex: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green.shade100,
            child: Icon(Icons.person, size: 60, color: Colors.green[700]),
          ),
          SizedBox(height: 15),

          // User Name
          Text(
            userName,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),

          // User Email
          Text(
            userEmail,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          SizedBox(height: 15),

          // Edit Profile Button
          OutlinedButton.icon(
            onPressed: () {
              // This would open the edit profile screen in a real app
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Edit profile functionality coming soon!'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: Icon(Icons.edit),
            label: Text("Edit Profile"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.green,
              side: BorderSide(color: Colors.green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade700, Colors.green.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Your Eco Stats",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(Icons.eco, "$ecoPoints", "Eco\nPoints"),
              _buildStatDivider(),
              _buildStatItem(
                Icons.event_available,
                "$totalActivities",
                "Activities\nCompleted",
              ),
              _buildStatDivider(),
              _buildStatItem(Icons.groups, "$totalClubs", "Clubs\nJoined"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "See All",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildClubsList() {
    return Column(children: clubs.map((club) => _buildClubCard(club)).toList());
  }

  Widget _buildClubCard(Map<String, dynamic> club) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: club["color"].withOpacity(0.5), width: 2),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: club["color"].withOpacity(0.2),
            child: Text(
              club["name"][0],
              style: TextStyle(
                color: club["color"],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  club["name"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  club["fullName"],
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: club["color"].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  club["role"],
                  style: TextStyle(
                    color: club["color"],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Since ${club["joinedDate"]}",
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivitiesList() {
    return Column(
      children:
          activities.map((activity) => _buildActivityCard(activity)).toList(),
    );
  }

  Widget _buildActivityCard(Map<String, dynamic> activity) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(activity["icon"], color: Colors.green, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity["title"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "${activity["organization"]} • ${activity["date"]}",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.eco, color: Colors.green, size: 16),
                SizedBox(width: 4),
                Text(
                  "${activity["points"]}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

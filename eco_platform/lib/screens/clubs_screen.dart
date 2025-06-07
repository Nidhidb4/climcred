import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/eco_app_bar.dart';

class ClubsScreen extends StatelessWidget {
  static const routeName = '/clubs';

  const ClubsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            EcoAppBar(title: "Clubs"),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Text(
                        "Environmental Clubs",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      Text(
                        "Join environmental clubs and make a difference!",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 25),

                      // NSS Club Card
                      _buildClubDetailCard(
                        "NSS",
                        "National Service Scheme",
                        "The National Service Scheme is a student-centered program that aims at developing student personality through community service. Environmental protection is one of their core areas of focus.",
                        Colors.green.shade600,
                        "120 members",
                        Icons.eco,
                        [
                          "Tree Plantation",
                          "Campus Cleaning",
                          "Environmental Awareness",
                        ],
                        context,
                      ),

                      SizedBox(height: 20),

                      // Rotaract Club Card
                      _buildClubDetailCard(
                        "Rotaract",
                        "Rotary Action",
                        "Rotaract clubs bring together people ages 18 and older to exchange ideas with leaders in the community, develop leadership and professional skills, and have fun through service.",
                        Colors.blue.shade600,
                        "95 members",
                        Icons.people,
                        [
                          "Beach Cleanup",
                          "Waste Management",
                          "Sustainable Development",
                        ],
                        context,
                      ),

                      SizedBox(height: 20),

                      // Eco Tech Club Card
                      _buildClubDetailCard(
                        "Eco Tech",
                        "Technology for Sustainability",
                        "Eco Tech Club focuses on leveraging technology to create sustainable solutions for environmental challenges. They promote innovation in green technology.",
                        Colors.orange.shade600,
                        "75 members",
                        Icons.lightbulb,
                        [
                          "Solar Energy",
                          "E-waste Management",
                          "Innovative Solutions",
                        ],
                        context,
                      ),

                      SizedBox(height: 30),

                      // Upcoming Club Events
                      Text(
                        "Upcoming Club Events",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(height: 15),

                      // Upcoming events list
                      _buildUpcomingEventItem(
                        "Environmental Symposium",
                        "May 22, 2025",
                        "NSS",
                        Colors.green,
                      ),
                      _buildUpcomingEventItem(
                        "Beach Cleanup Drive",
                        "May 25, 2025",
                        "Rotaract",
                        Colors.blue,
                      ),
                      _buildUpcomingEventItem(
                        "Solar Panel Workshop",
                        "June 3, 2025",
                        "Eco Tech",
                        Colors.orange,
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavigation(currentIndex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildClubDetailCard(
    String name,
    String fullName,
    String description,
    Color color,
    String members,
    IconData icon,
    List<String> focusAreas,
    BuildContext context,
  ) {
    return Container(
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
          // Club header with gradient
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white.withOpacity(0.9),
                  child: Icon(icon, size: 30, color: color),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        fullName,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    members,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Club description and details
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  "Focus Areas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10),

                // Focus areas chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      focusAreas
                          .map(
                            (area) => Chip(
                              label: Text(area),
                              backgroundColor: color.withOpacity(0.1),
                              labelStyle: TextStyle(color: color),
                            ),
                          )
                          .toList(),
                ),

                SizedBox(height: 15),

                // Join button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Request sent to join $name!'),
                          backgroundColor: color,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Join Club",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEventItem(
    String title,
    String date,
    String organizer,
    Color color,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.event, color: color),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "By $organizer",
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: color, size: 16),
        ],
      ),
    );
  }
}

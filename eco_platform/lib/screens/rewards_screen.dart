import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/eco_app_bar.dart';

class RewardsScreen extends StatefulWidget {
  static const routeName = '/rewards';

  const RewardsScreen({Key? key}) : super(key: key);

  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  // Sample data for rewards
  final List<Map<String, dynamic>> rewardsCategories = [
    {
      "title": "Featured",
      "items": [
        {
          "name": "Bamboo Cutlery Set",
          "points": 100,
          "image": "cutlery",
          "description":
              "Eco-friendly bamboo cutlery set including fork, knife, spoon and chopsticks.",
        },
        {
          "name": "Organic Cotton Tote Bag",
          "points": 75,
          "image": "bag",
          "description": "Sustainably made tote bag from 100% organic cotton.",
        },
        {
          "name": "Reusable Water Bottle",
          "points": 120,
          "image": "bottle",
          "description":
              "Stainless steel water bottle that keeps drinks cold for 24 hours.",
        },
      ],
    },
    {
      "title": "Vouchers",
      "items": [
        {
          "name": "Plant-based Cafe - 20% Off",
          "points": 50,
          "image": "cafe",
          "description": "20% discount on your next meal at Plant-based Cafe.",
        },
        {
          "name": "Eco Grocery - 15% Off",
          "points": 60,
          "image": "grocery",
          "description": "15% discount on your next purchase at Eco Grocery.",
        },
      ],
    },
    {
      "title": "Sustainable Products",
      "items": [
        {
          "name": "Reusable Beeswax Wraps",
          "points": 90,
          "image": "wraps",
          "description":
              "Set of 3 beeswax wraps - a sustainable alternative to plastic wrap.",
        },
        {
          "name": "Bamboo Toothbrush Set",
          "points": 45,
          "image": "toothbrush",
          "description": "Pack of 4 biodegradable bamboo toothbrushes.",
        },
        {
          "name": "Solar Power Bank",
          "points": 200,
          "image": "powerbank",
          "description":
              "Charge your devices using solar energy with this 10000mAh power bank.",
        },
        {
          "name": "Compostable Phone Case",
          "points": 85,
          "image": "case",
          "description":
              "Fully compostable phone case made from plant-based materials.",
        },
      ],
    },
  ];

  int userPoints = 150; // Sample points, would come from API in a real app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            EcoAppBar(title: "Rewards"),
            _buildPointsHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),

                      // Build each category section
                      for (var category in rewardsCategories) ...[
                        _buildCategoryHeader(category["title"]),
                        SizedBox(height: 15),
                        _buildCategoryItems(category["items"]),
                        SizedBox(height: 30),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            BottomNavigation(currentIndex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade700, Colors.green.shade500],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Your Eco Points",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.eco, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                "$userPoints",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Redeem your points for eco-friendly rewards",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
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

  Widget _buildCategoryItems(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildRewardItem(item);
      },
    );
  }

  Widget _buildRewardItem(Map<String, dynamic> item) {
    bool canRedeem = userPoints >= item["points"];

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Icon(
              _getIconForItem(item["image"]),
              color: Colors.green,
              size: 50,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.eco, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "${item["points"]}",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        canRedeem
                            ? () => _showRedeemDialog(context, item)
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canRedeem ? Colors.green : Colors.grey,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      textStyle: TextStyle(fontSize: 12),
                    ),
                    child: Text(canRedeem ? "REDEEM" : "NOT ENOUGH POINTS"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showRedeemDialog(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Redeem Reward"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getIconForItem(item["image"]),
                  color: Colors.green,
                  size: 60,
                ),
                SizedBox(height: 16),
                Text(
                  item["name"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(item["description"], textAlign: TextAlign.center),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.eco, color: Colors.green),
                    SizedBox(width: 4),
                    Text(
                      "${item["points"]} points",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("CANCEL"),
              ),
              ElevatedButton(
                onPressed: () {
                  // This would call your API to process the redemption
                  // For now, just show a success message
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Reward redeemed successfully!"),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("CONFIRM"),
              ),
            ],
          ),
    );
  }

  IconData _getIconForItem(String imageType) {
    // Map string keys to actual icons
    switch (imageType) {
      case "cutlery":
        return Icons.restaurant;
      case "bag":
        return Icons.shopping_bag;
      case "bottle":
        return Icons.water_drop;
      case "cafe":
        return Icons.local_cafe;
      case "grocery":
        return Icons.local_grocery_store;
      case "wraps":
        return Icons.wrap_text;
      case "toothbrush":
        return Icons.cleaning_services;
      case "powerbank":
        return Icons.battery_charging_full;
      case "case":
        return Icons.phone_android;
      default:
        return Icons.card_giftcard;
    }
  }
}

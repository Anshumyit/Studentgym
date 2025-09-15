import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEFF4FB),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gymbackground.png'),
            fit: BoxFit.cover, // or BoxFit.fill or BoxFit.contain
          ),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top greeting + avatar
            Padding(
              padding: const EdgeInsets.only(top: 40,right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text("G", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Gym',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/44.jpg', // replace with actual photo
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Hi, Jenny',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),

            // Current plan & attendance
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Plan", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 8),
                          Text("Pro Plan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("Valid until 24. May 2024",
                              style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lightBlueAccent],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Attendance\nThis month",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 8),
                          Text("20",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // BMI & Diet Plan
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BMI Tracker", style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 8),
                        Text("23.4",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Diet Plan", style: TextStyle(color: Colors.black54)),
                            SizedBox(height: 8),
                            Text("PDF", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Icon(Icons.file_download, color: Colors.blue),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Subscription Plans Title
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Subscription plans",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),

            // Subscription Cards
            Row(
              children: [
                Expanded(
                  child: SubscriptionCard(
                    title: "Basic Plan",
                    duration: "1 Month",
                    benefits: ["Access to gym", "Fitness classes"],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SubscriptionCard(
                    title: "Pro Plan",
                    duration: "3 Months",
                    benefits: ["Access to gym", "Fitness classes"],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class SubscriptionCard extends StatelessWidget {
  final String title;
  final String duration;
  final List<String> benefits;

  const SubscriptionCard({
    required this.title,
    required this.duration,
    required this.benefits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(duration, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 12),
          ...benefits
              .map((benefit) => Row(
            children: [
              Icon(Icons.check, color: Colors.blue, size: 16),
              SizedBox(width: 6),
              Text(benefit),
            ],
          ))
              .toList(),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(double.infinity, 40),
            ),
            child: Text("Enroll"),
          ),
        ],
      ),
    );
  }
}

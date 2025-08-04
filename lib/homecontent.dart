import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitbot/weightloss.dart';
import 'package:fitbot/weightgain.dart';
import 'package:fitbot/maintainweight.dart';
import 'package:fitbot/immunity.dart';
import 'package:fitbot/bmi.dart';

class HomeContent extends StatelessWidget {
  final String _motivationalQuote =
      "Every workout counts! Keep pushing forward!";

  final List<Map<String, dynamic>> goals = [
    {
      'title': 'Weight Loss',
      'icon': Icons.trending_down,
      'color': Colors.red,
      'page': const WeightLossPage(),
    },
    {
      'title': 'Weight Gain',
      'icon': Icons.trending_up,
      'color': Colors.green,
      'page': const WeightGainPage(),
    },
    {
      'title': 'Maintain Weight',
      'icon': Icons.trending_flat,
      'color': Colors.blue,
      'page': const MaintainWeightPage(),
    },
    {
      'title': 'Improve Immunity',
      'icon': Icons.health_and_safety,
      'color': Colors.purple,
      'page': const ImmunityPage(),
    },
    {
      'title': 'BMI Calculator',
      'icon': Icons.calculate,
      'color': Colors.orange,
      'page': const Calculator(),
    },
  ];
 Future<String> getUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        return doc['username'] ?? 'User';
      }
    }
    return 'User';
  }
  @override
  Widget build(BuildContext context) {
    

    return SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 99, 99),
              Color.fromARGB(255, 54, 123, 179),
            ],
          begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
              // ✅ Fetch username using FutureBuilder
            FutureBuilder<String>(
              future: getUsername(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text(
                    "Welcome, User!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 70, 73, 74),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Text(
                    "Welcome, ${snapshot.data}!",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 70, 73, 74),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ready to crush your fitness goals today?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 70, 73, 74),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
      
            // Motivational Quote Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.lightbulb, color: Colors.amber),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _motivationalQuote,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 20),
      
            // Carousel for Goals
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: goals.map((goal) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => goal['page']));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: goal['color'],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(goal['icon'], size: 50, color: Colors.white),
                            const SizedBox(height: 15),
                            Text(
                              goal['title'],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            buildTodaysTodoList()
          ],
        ),
      ),
    );
  }Widget buildTodaysTodoList() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) return const SizedBox();

  DateTime todayStart = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime todayEnd = todayStart.add(const Duration(days: 1));

  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('todos')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(todayStart))
        .where('date', isLessThan: Timestamp.fromDate(todayEnd))
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError || !snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No tasks for today 👀',
            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16),
          ),
        );
      }

      final todos = snapshot.data!.docs;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("🗓️ Today's Tasks", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
            const SizedBox(height: 12),
            ...todos.map((doc) {
              final title = doc['title'] ?? 'Untitled Task';
              final completed = doc['completed'] ?? false;

              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                color: completed ? Colors.green.shade100 : Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: Icon(
                    completed ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: completed ? Colors.green : Colors.grey,
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(completed ? "Completed" : "Pending"),
                ),
              );
            }).toList(),
          ],
        ),
      );
    },
  );
}

}

import 'package:fitbot/bmi.dart';
import 'package:fitbot/immunity.dart';
import 'package:fitbot/maintainweight.dart';
import 'package:fitbot/weightgain.dart';
import 'package:fitbot/weightloss.dart';
import 'package:flutter/material.dart';
import 'gender.dart';

class Types extends StatelessWidget {
  const Types({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What's your goal?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            GoalButton(
              goal: 'Weight Loss',
              icon: Icons.trending_down,
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeightLossPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            GoalButton(
              goal: 'Weight Gain',
              icon: Icons.trending_up,
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeightGainPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            GoalButton(
              goal: 'Maintain Weight',
              icon: Icons.trending_flat,
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MaintainWeightPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            GoalButton(
              goal: 'Improve Immunity',
              icon: Icons.health_and_safety,
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImmunityPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            GoalButton(
              goal: 'BMI Calculator',
              icon: Icons.calculate,
              color: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Calculator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GoalButton extends StatelessWidget {
  final String goal;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const GoalButton({
    super.key,
    required this.goal,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              goal,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

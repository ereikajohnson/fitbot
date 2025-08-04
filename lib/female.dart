
import 'package:fitbot/types.dart';
import 'package:flutter/material.dart';


class Femalepage extends StatelessWidget {
  const Femalepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FEMALE DIET PLANS"),
      ),
      body: GestureDetector(
        onTap: () {
        
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TodoPage()),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
          child: const Center(
            child: Text(
              "Every Body Matters",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
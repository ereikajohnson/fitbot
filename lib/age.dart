import 'package:fitbot/gender.dart';
import 'package:fitbot/type.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  final TextEditingController _ageController = TextEditingController();
  bool _showButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,height: double.infinity,
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "What's your Birthday?",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "We use your age to personalize your workout plans and diet",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Lottie.asset("assets/CALENDER.json"),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter your age",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _showButton = value.isNotEmpty;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 40),
                if (_showButton)
                  ElevatedButton(
                    onPressed: () {
                      if (_ageController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Genders(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

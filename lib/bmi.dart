import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String result = '';
  void calc() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    double bmi = weight / (height * height);
    setState(() {
      result = 'Your BMI is: ${bmi.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 230, 99, 99),
              Color.fromARGB(255, 54, 123, 179),],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 350,
              width: 350,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder(),
                          labelText: 'Height (cm)',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          prefixIcon: Icon(Icons.monitor_weight),
                          border: OutlineInputBorder(),
                          labelText: 'Weight (kg)',
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 230, 99, 99),
              Color.fromARGB(255, 54, 123, 179),],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              calc();
                            },
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

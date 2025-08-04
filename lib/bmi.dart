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
  String category = '';
  
  void calc() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    double bmi = weight / (height * height);
    
    setState(() {
      result = 'Your BMI is: ${bmi.toStringAsFixed(2)}';
      
      
      if (bmi < 18.5) {
        category = 'Underweight (below 18.5)';
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        category = 'Normal weight (18.5 to 24.9)';
      } else if (bmi >= 25.0 && bmi <= 29.9) {
        category = 'Overweight (25.0 to 29.9)';
      } else {
        category = 'Obese (30.0 and above)';
      }
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
            colors: [
              Color.fromARGB(255, 230, 99, 99),
              Color.fromARGB(255, 54, 123, 179),
            ],
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
              height: 400, 
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
                            colors: [
                              Color.fromARGB(255, 230, 99, 99),
                              Color.fromARGB(255, 54, 123, 179),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: calc,
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
                      SizedBox(height: 20),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: _getCategoryColor(),
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

  Color _getCategoryColor() {
    if (category.contains('Underweight')) {
      return Colors.blue;
    } else if (category.contains('Normal')) {
      return Colors.green;
    } else if (category.contains('Overweight')) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
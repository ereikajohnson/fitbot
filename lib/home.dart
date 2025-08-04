import 'package:fitbot/bmi.dart';
import 'package:fitbot/chatbot.dart';
import 'package:fitbot/settings.dart';
import 'package:fitbot/type.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Center(child: Text('Calculator Page Content')),
    );
  }
}

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Goals')),
      body: Center(child: Text('Goals Page Content')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Page Content')),
    );
  }
}

class homee extends StatefulWidget {
  const homee({super.key});

  @override
  State<homee> createState() => _homeeState();
}

class _homeeState extends State<homee> {
  int _currentIndex = 0;
  final String _motivationalQuote =
      "Every workout counts! Keep pushing forward!";

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FITBOT'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 7, 6, 6)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('No new notifications')));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotScreen()),
          );
        },
        child: Icon(Icons.psychology_alt),
      ),
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 70, 73, 74),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Ready to crush your fitness goals today?",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 70, 73, 74),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

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
                      Icon(Icons.lightbulb, color: Colors.amber),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _motivationalQuote,
                          style: TextStyle(fontSize: 16),
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 230, 99, 99),
                    Color.fromARGB(255, 54, 123, 179),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                "FITBOT",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(context, homee());
              },
            ),
            Divider(height: 1, thickness: 1),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(context, SettingsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.blue),
              title: Text("Help & Feedback"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.blue),
              title: Text("About Us"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text("Premium"),
              trailing: Icon(Icons.workspace_premium, color: Colors.amber),
              onTap: () {},
            ),
            Divider(height: 1, thickness: 1),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              _navigateToPage(context, homee());
              break;
            case 1:
              _navigateToPage(context, Calculator());
              break;
            case 2:
              _navigateToPage(context, Types());
              break;
            case 3:
              _navigateToPage(context, settingss());
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 54, 123, 179),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'BMI Calculator',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goals'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

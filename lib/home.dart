import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitbot/login.dart';
import 'package:fitbot/recipe.dart';
import 'package:fitbot/homecontent.dart';
import 'package:fitbot/bmi.dart';
import 'package:fitbot/settings.dart';
import 'package:fitbot/types.dart';
import 'package:fitbot/chatbot.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    const Calculator(),
    const TodoPage(),
    const Settingss(),
  ];

  Future<void> pickUploadAndSaveProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    File imageFile = File(pickedFile.path);

    const cloudinaryUrl = 'https://api.cloudinary.com/v1_1/dd2a2od00/image/upload';
    const uploadPreset = 'profile image';

    final request = http.MultipartRequest('POST', Uri.parse(cloudinaryUrl))
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);
      final imageUrl = data['secure_url'];

      final uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'profileImage': imageUrl,
      });

      setState(() {}); 
    } else {
      print('Upload failed: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 230, 99, 99), Color.fromARGB(255, 54, 123, 179)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'FITBOT',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No new notifications')),
                );
              },
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .get(),
              builder: (context, snapshot) {
                String? imageUrl;
                String username = "User";
                String email = "email@example.com";

                if (snapshot.hasData && snapshot.data!.exists) {
                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  username = data['username'] ?? username;
                  email = data['email'] ?? email;
                  imageUrl = data['profileImage'];
                }

                return UserAccountsDrawerHeader(
                  accountName: Text(username),
                  accountEmail: Text(email),
                  currentAccountPicture: GestureDetector(
                    onTap: pickUploadAndSaveProfileImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
                      child: imageUrl == null
                          ? const Icon(Icons.person, color: Colors.grey)
                          : null,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 230, 99, 99), Color.fromARGB(255, 54, 123, 179)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 0);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 3);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "chatbot",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatbotScreen()));
            },
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.psychology_alt, color: Colors.white),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: "AI Recipe",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeScreen()));
            },
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.task_alt, color: Colors.white),
          ),
        ],
      ),

      body: _pages[_currentIndex],

      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        height: 60,
        color: const Color.fromARGB(255, 230, 99, 99),
        buttonBackgroundColor: const Color.fromARGB(255, 245, 192, 192),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.calculate, size: 30, color: Colors.white),
          Icon(Icons.flag, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}

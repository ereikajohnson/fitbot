import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbot/age.dart';
import 'package:fitbot/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> signup({
  required String username,
  required String email,
  required String Password,
  required String Confirm,
  required BuildContext context,
}) async {
  try {
    // 1. Create User with Firebase Auth
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: Password);

    User? user = userCredential.user;

    if (user != null) {
      
      await user.updateDisplayName(username);

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User created successfully")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: ${e.toString()}")),
    );
  }
}
Future<void> login({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login successful")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainLayout()),
    );
  } on FirebaseAuthException catch (e) {
    String message = "An error occurred";
    if (e.code == 'user-not-found') {
      message = "No user found with this email.";
    } else if (e.code == 'wrong-password') {
      message = "Incorrect password.";
    } else if (e.code == 'invalid-email') {
      message = "Invalid email address.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Unexpected error: ${e.toString()}")),
    );
  }
}


Future<void> forgot({
  required String email,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("password reset link send")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

class GeminiService {
  static const String apiKey = "AIzaSyCBDiT-__7Yf-qp2r3ccmX5KECwqprW-fQ"; 
  static const String url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey";

  static Future<String> getRecipes(String ingredients) async {
  final body = jsonEncode({
    "contents": [
      {
        "parts": [
          {
            "text":
                "Suggest 3 simple recipes using: $ingredients. Include estimated calorie count per serving for each. Avoid using asterisks or markdown formatting."
          }
        ]
      }
    ]
  });

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String text = data['candidates'][0]['content']['parts'][0]['text'];

      // Optional: Remove any stray asterisks if still present
      text = text.replaceAll("*", "").trim();

      return text;
    } else {
      return "Error: ${response.body}";
    }
  } catch (e) {
    return "Error: $e";
  }
}

}

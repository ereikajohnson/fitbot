import 'package:fitbot/age.dart';
import 'package:fitbot/login.dart';
import 'package:fitbot/service.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _obscurePassword = true; 
  bool _obscureConfirmPassword = true; 

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
        child: Form(
          key: formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "signup",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 8, 8),
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Username"),
                  ),
                  TextFormField(
                    controller: usernamecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "username is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email"),
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email is required ";
                      }
                      if (!value.contains("@")) {
                        return "@ is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password"),
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "minimum 8 character is required";
                      }
                      return null;
                    },
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Password"),
                  ),
                  TextFormField(
                    controller: confirmpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value != passwordcontroller.text) {
                        return "Password is not the same";
                      }
                      return null;
                    },
                    obscureText: _obscureConfirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          signup(
                            username: usernamecontroller.text,
                            email: emailcontroller.text,
                            Password: passwordcontroller.text,
                            Confirm: confirmpasswordcontroller.text,
                            context: context,
                          );
                        }
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
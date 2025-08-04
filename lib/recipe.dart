import 'package:flutter/material.dart';
import 'service.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _result;
  bool _loading = false;

  void _fetchRecipes() async {
    setState(() {
      _loading = true;
      _result = null;
    });

    final res = await GeminiService.getRecipes(_controller.text);

    setState(() {
      _result = res;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Recipe Recommender")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter ingredients (comma separated)",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _fetchRecipes();
                }
              },
              child: const Text("Get Recipes"),
            ),
            const SizedBox(height: 20),
            if (_loading) const CircularProgressIndicator(),
            if (_result != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _result!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

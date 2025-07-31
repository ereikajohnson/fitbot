import 'package:flutter/material.dart';

class WeightLossPage extends StatelessWidget {
  const WeightLossPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Loss Plan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 246, 242, 242),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  '📝 Weight Loss Diet Plan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildMealTime(
                icon: Icons.breakfast_dining,
                time: 'Breakfast (8:00 AM - 9:00 AM)',
                items: [
                  'Oats porridge with skimmed milk + 5 almonds',
                  'OR 2 boiled eggs + 1 slice multigrain toast',
                  'Green tea or black coffee (no sugar)',
                ],
              ),
              _buildMealTime(
                icon: Icons.apple,
                time: 'Mid-Morning Snack (11:00 AM)',
                items: [
                  '1 fruit (apple/orange/papaya)',
                  'OR handful of roasted chana or foxnuts (makhana)',
                ],
              ),
              _buildMealTime(
                icon: Icons.lunch_dining,
                time: 'Lunch (1:00 PM - 2:00 PM)',
                items: [
                  '1 cup brown rice or 2 phulkas (no oil)',
                  '1 cup dal or grilled paneer',
                  'Mixed vegetable sabzi + salad + 1 bowl curd',
                ],
              ),
              _buildMealTime(
                icon: Icons.emoji_food_beverage,
                time: 'Evening Snack (4:30 PM - 5:00 PM)',
                items: [
                  'Green tea + 2 digestive biscuits',
                  'OR Sprout chaat with lemon and cucumber',
                ],
              ),
              _buildMealTime(
                icon: Icons.dinner_dining,
                time: 'Dinner (7:00 PM - 8:00 PM)',
                items: [
                  'Clear vegetable soup + 1 multigrain roti + sabzi',
                  'OR Grilled tofu/paneer salad with olive oil dressing',
                ],
              ),
              _buildMealTime(
                icon: Icons.nightlight_round,
                time: 'Optional (If hungry at night - 9:00 PM)',
                items: [
                  '1 glass warm turmeric milk (low-fat)',
                  'OR Soaked chia seeds in water',
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '✅ Daily Tips',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              _buildTip(Icons.water_drop, 'Drink 2.5–3 liters of water'),
              _buildTip(Icons.access_time, 'Eat on time, avoid late-night meals'),
              _buildTip(Icons.no_food, 'No sugary drinks or fried food'),
              _buildTip(Icons.directions_walk, 'Walk for 20–30 mins after meals'),
              _buildTip(Icons.control_camera, 'Practice portion control'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealTime({
    required IconData icon,
    required String time,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(left: 32, bottom: 4),
          child: Text(
            '• $item',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.4,
            ),
          ),
        )),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTip(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
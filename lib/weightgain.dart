import 'package:flutter/material.dart';

class WeightGainPage extends StatelessWidget {
  const WeightGainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Gain Plan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 249, 248, 248),
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
                  '📝 Weight Gain Diet Plan',
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
                time: '8:00 AM – Breakfast',
                items: [
                  '3 whole eggs scrambled with vegetables + 2 slices whole wheat toast',
                  '1 glass whole milk with 1 tsp honey',
                  '1 banana',
                ],
              ),
              _buildMealTime(
                icon: Icons.apple,
                time: '10:30 AM – Mid-Morning Snack',
                items: [
                  'Handful of almonds (8–10) and 2 dates',
                  '1 boiled sweet potato',
                ],
              ),
              _buildMealTime(
                icon: Icons.lunch_dining,
                time: '1:00 PM – Lunch',
                items: [
                  '1 cup cooked brown rice',
                  '1 cup chana masala (chickpeas)',
                  '½ cup curd',
                  'Salad (carrot, cucumber, beetroot with lemon)',
                ],
              ),
              _buildMealTime(
                icon: Icons.emoji_food_beverage,
                time: '4:30 PM – Evening Snack',
                items: [
                  'Peanut butter (2 tbsp) on 2 slices of multigrain bread',
                  '1 glass banana + milk smoothie',
                ],
              ),
              _buildMealTime(
                icon: Icons.dinner_dining,
                time: '7:30 PM – Dinner',
                items: [
                  '2 chapatis with ghee',
                  '1 cup paneer curry',
                  '1 bowl mixed sabzi',
                  '1 small bowl of dal',
                ],
              ),
              _buildMealTime(
                icon: Icons.nightlight_round,
                time: '10:00 PM – Bedtime Snack',
                items: [
                  '1 glass warm milk with 1 tsp turmeric',
                  '2 dates or 1 piece of dark chocolate (optional)',
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '✅ Weight Gain Tips',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              _buildTip(Icons.food_bank, 'Consume calorie-dense foods regularly'),
              _buildTip(Icons.fitness_center, 'Combine with strength training 3-4 times/week'),
              _buildTip(Icons.water_drop, 'Stay hydrated but avoid drinking before meals'),
              _buildTip(Icons.timer, 'Eat every 2-3 hours to maintain calorie surplus'),
              _buildTip(Icons.monitor_weight, 'Track weekly weight progress'),
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
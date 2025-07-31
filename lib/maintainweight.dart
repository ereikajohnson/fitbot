import 'package:flutter/material.dart';

class MaintainWeightPage extends StatelessWidget {
  const MaintainWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Maintenance Plan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
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
                  '📝 7-Day Weight Maintenance Diet Plan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildDayPlan(
                day: 'Day 1 (Balanced Start)',
                meals: [
                  'Morning (8:00 AM): Vegetable poha + 1 boiled egg + 1 orange',
                  'Mid-morning (10:30 AM): Roasted chana + Buttermilk',
                  'Lunch (1:00 PM): 2 rotis + bhindi sabzi + ½ cup brown rice + dal + salad',
                  'Evening Snack (4:30 PM): Papaya + green tea',
                  'Dinner (7:30 PM): Moong dal + 2 phulkas + steamed broccoli',
                  'Bedtime (10:00 PM): Warm turmeric milk + 1 date',
                ],
              ),
              _buildDayPlan(
                day: 'Day 2 (Protein Focus)',
                meals: [
                  'Morning: Oats porridge with milk, chia, almonds + 1 banana',
                  'Mid-morning: 1 cup coconut water + 2 dates',
                  'Lunch: 1 cup rajma + 1 cup rice + 1 roti + salad',
                  'Evening Snack: Boiled corn + black tea',
                  'Dinner: 2 multigrain rotis + paneer curry + cucumber salad',
                  'Bedtime: 1 glass milk (low-fat)',
                ],
              ),
              _buildDayPlan(
                day: 'Day 3 (South Indian Inspired)',
                meals: [
                  'Morning: 2 idlis + sambar + coconut chutney',
                  'Mid-morning: 1 apple + handful of peanuts',
                  'Lunch: Lemon rice + 1 boiled egg (or curd) + carrot salad',
                  'Evening Snack: Roasted makhana + herbal tea',
                  'Dinner: Vegetable khichdi + curd + sautéed beans',
                  'Bedtime: Milk with a pinch of cinnamon',
                ],
              ),
              _buildDayPlan(
                day: 'Day 4 (Fiber Boost)',
                meals: [
                  'Morning: Multigrain toast + peanut butter + 1 boiled egg',
                  'Mid-morning: 1 pear + 3 walnuts',
                  'Lunch: 2 chapatis + lauki curry + dal + salad',
                  'Evening Snack: Fruit salad + green tea',
                  'Dinner: Millet upma + vegetable raita',
                  'Bedtime: 1 small cup warm milk',
                ],
              ),
              _buildDayPlan(
                day: 'Day 5 (Simple & Light)',
                meals: [
                  'Morning: Ragi porridge + banana + 1 egg (optional)',
                  'Mid-morning: Buttermilk + almonds',
                  'Lunch: 2 rotis + methi aloo + dal',
                  'Evening Snack: Coconut water + murmura',
                  'Dinner: Vegetable pulao + curd',
                  'Bedtime: Warm milk with turmeric',
                ],
              ),
              _buildDayPlan(
                day: 'Day 6 (High Energy Day)',
                meals: [
                  'Morning: Stuffed paneer paratha + curd + 1 fruit',
                  'Mid-morning: Dates + peanuts',
                  'Lunch: 2 rotis + palak tofu + rice + salad',
                  'Evening Snack: Vegetable soup + toast',
                  'Dinner: Chole + 1 roti + sautéed greens',
                  'Bedtime: Milk with jaggery',
                ],
              ),
              _buildDayPlan(
                day: 'Day 7 (Light Detox)',
                meals: [
                  'Morning: Smoothie (banana + oats + milk + chia)',
                  'Mid-morning: 1 fruit + handful of seeds',
                  'Lunch: Steamed rice + rasam + beans thoran',
                  'Evening Snack: Makhana or fruit',
                  'Dinner: Dalia khichdi + curd + beetroot salad',
                  'Bedtime: Herbal milk (turmeric or cinnamon)',
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '✅ Weekly Tips',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              _buildTip(Icons.directions_walk, 'Walk or do light yoga for 30–45 mins/day'),
              _buildTip(Icons.water_drop, 'Hydrate with at least 2.5–3 liters of water daily'),
              _buildTip(Icons.no_food, 'Use minimal oil, avoid junk, stay consistent'),
              _buildTip(Icons.medical_services, 'Optional: Add 1 multivitamin or iron tablet if needed'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayPlan({
    required String day,
    required List<String> meals,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          '🟢 $day',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        ...meals.map((meal) => Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 6),
          child: Text(
            '• $meal',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.4,
            ),
          ),
        )),
        const SizedBox(height: 12),
        const Divider(color: Colors.white54, height: 1),
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
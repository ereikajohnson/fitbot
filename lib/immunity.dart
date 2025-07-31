import 'package:flutter/material.dart';

class ImmunityPage extends StatelessWidget {
  const ImmunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Immunity Boost Plan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 245, 244, 244),
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
                  '📝 7-Day Immunity Boost Plan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildDayPlan(
                emoji: '🍋',
                day: 'Day 1: Vitamin C Boost',
                meals: [
                  'Morning (8:00 AM):',
                  '• Warm lemon water with honey',
                  '• Vegetable upma with carrots, peas',
                  '• 1 orange',
                  '',
                  'Mid-Morning (10:30 AM):',
                  '• Handful of walnuts + 1 guava',
                  '',
                  'Lunch (1:00 PM):',
                  '• 2 rotis',
                  '• Palak dal (iron + vitamin A)',
                  '• Brown rice',
                  '• Cucumber + beet salad',
                  '• ½ cup curd',
                  '',
                  'Evening Snack (4:30 PM):',
                  '• Herbal tea with tulsi or ginger',
                  '• Roasted pumpkin seeds',
                  '',
                  'Dinner (7:30 PM):',
                  '• Moong dal soup',
                  '• 1 multigrain roti',
                  '• Mixed sabzi (broccoli, beans, capsicum)',
                  '',
                  'Bedtime (10:00 PM):',
                  '• Turmeric milk + 1 date',
                ],
              ),
              _buildDayPlan(
                emoji: '🥝',
                day: 'Day 2: Antioxidant Rich',
                meals: [
                  'Morning:',
                  '• Chia seed lemon water',
                  '• Oats porridge with apple and cinnamon',
                  '• 4 soaked almonds',
                  '',
                  'Mid-Morning:',
                  '• 1 kiwi or amla juice',
                  '',
                  'Lunch:',
                  '• 2 rotis',
                  '• Rajma curry',
                  '• Quinoa or brown rice',
                  '• Grated carrot and tomato salad',
                  '',
                  'Evening Snack:',
                  '• Makhana roasted in ghee + green tea',
                  '',
                  'Dinner:',
                  '• Vegetable stew with curry leaves',
                  '• 2 idlis + coconut chutney',
                  '',
                  'Bedtime:',
                  '• Warm milk + pinch of cinnamon',
                ],
              ),
              _buildDayPlan(
                emoji: '🧄',
                day: 'Day 3: Gut + Immune Health',
                meals: [
                  'Morning:',
                  '• Cumin seed water (jeera)',
                  '• Ragi dosa + chutney',
                  '• 1 banana',
                  '',
                  'Mid-Morning:',
                  '• 1 boiled egg (or sprouts) + dates',
                  '',
                  'Lunch:',
                  '• 1 bowl curd rice',
                  '• Bhindi stir fry',
                  '• Moong dal',
                  '',
                  'Evening Snack:',
                  '• Roasted chana + lemon tea',
                  '',
                  'Dinner:',
                  '• Khichdi with ghee + vegetable stir fry',
                  '• Buttermilk',
                  '',
                  'Bedtime:',
                  '• 1 glass warm milk',
                ],
              ),
              _buildDayPlan(
                emoji: '🍠',
                day: 'Day 4: Root & Leafy Veg Focus',
                meals: [
                  'Morning:',
                  '• Ginger-tulsi tea',
                  '• Sweet potato boiled or sautéed + 1 toast',
                  '• ½ papaya',
                  '',
                  'Mid-Morning:',
                  '• Mixed seeds (flax, sunflower)',
                  '',
                  'Lunch:',
                  '• 2 rotis',
                  '• Methi or drumstick leaves curry',
                  '• Toor dal + curd',
                  '• Raw salad',
                  '',
                  'Evening Snack:',
                  '• Vegetable soup (carrot, garlic, celery)',
                  '',
                  'Dinner:',
                  '• Dalia khichdi + sautéed spinach + curd',
                  '',
                  'Bedtime:',
                  '• Turmeric milk',
                ],
              ),
              _buildDayPlan(
                emoji: '🧅',
                day: 'Day 5: Zinc + Vitamin D Focus',
                meals: [
                  'Morning:',
                  '• Lemon water',
                  '• Paneer sandwich (multigrain bread)',
                  '• 1 small banana',
                  '',
                  'Mid-Morning:',
                  '• 4 soaked walnuts + 2 dates',
                  '',
                  'Lunch:',
                  '• 2 rotis',
                  '• Lauki chana dal',
                  '• Steamed rice',
                  '• Curd with a pinch of black pepper',
                  '',
                  'Evening Snack:',
                  '• Garlic roasted makhana + green tea',
                  '',
                  'Dinner:',
                  '• Besan chilla + mint chutney',
                  '• Tomato soup',
                  '',
                  'Bedtime:',
                  '• 1 glass milk + jaggery',
                ],
              ),
              _buildDayPlan(
                emoji: '🥒',
                day: 'Day 6: Hydration & Detox',
                meals: [
                  'Morning:',
                  '• Cucumber-mint detox water',
                  '• Poha with peanuts',
                  '• 1 apple',
                  '',
                  'Mid-Morning:',
                  '• 1 glass coconut water',
                  '',
                  'Lunch:',
                  '• Millet roti (bajra or jowar)',
                  '• Tur dal',
                  '• Cabbage and carrot sabzi',
                  '• Curd',
                  '',
                  'Evening Snack:',
                  '• Fruit chaat with lemon and black salt',
                  '',
                  'Dinner:',
                  '• Vegetable soup + 2 small moong cheelas',
                  '',
                  'Bedtime:',
                  '• Warm haldi milk',
                ],
              ),
              _buildDayPlan(
                emoji: '🧘',
                day: 'Day 7: Probiotic & Balanced',
                meals: [
                  'Morning:',
                  '• Tulsi water or herbal detox drink',
                  '• Oats banana pancake',
                  '• 1 handful of raisins',
                  '',
                  'Mid-Morning:',
                  '• Probiotic drink (yakult or homemade buttermilk)',
                  '',
                  'Lunch:',
                  '• 2 rotis',
                  '• Chole curry',
                  '• Cooked rice',
                  '• Mixed raw salad',
                  '• ½ cup curd',
                  '',
                  'Evening Snack:',
                  '• Dry fruit laddoo + chamomile tea',
                  '',
                  'Dinner:',
                  '• Lemon coriander soup',
                  '• 1 cup khichdi with veggies',
                  '',
                  'Bedtime:',
                  '• Warm milk with a pinch of nutmeg',
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                '✅ Key Immune Boosting Nutrients in This Plan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              _buildNutrient('Vitamin C:', 'Amla, oranges, kiwi, lemon'),
              _buildNutrient('Vitamin D:', 'Sunlight + milk + mushrooms'),
              _buildNutrient('Zinc & Selenium:', 'Pumpkin seeds, dal, garlic'),
              _buildNutrient('Probiotics:', 'Curd, buttermilk, fermented foods'),
              _buildNutrient('Antioxidants:', 'Green tea, turmeric, veggies'),
              _buildNutrient('Iron:', 'Greens, jaggery, dates'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayPlan({
    required String emoji,
    required String day,
    required List<String> meals,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          '$emoji $day',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        ...meals.map((meal) {
          if (meal.isEmpty) {
            return const SizedBox(height: 8);
          }
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              meal,
              style: TextStyle(
                fontSize: meal.startsWith('•') ? 16 : 17,
                color: Colors.white,
                height: 1.4,
                fontWeight: meal.startsWith('•') ? FontWeight.normal : FontWeight.w500,
              ),
            ),
          );
        }),
        const SizedBox(height: 12),
        const Divider(color: Colors.white54, height: 1),
      ],
    );
  }

  Widget _buildNutrient(String nutrient, String sources) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nutrient,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              sources,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
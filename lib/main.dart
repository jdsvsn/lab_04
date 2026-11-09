import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class Routes {
  static const String menu = 'menu';
  static const String vegetable = 'vegetable';
  static const String cheese = 'cheese';
  static const String fries = 'fries';
}

class MenuItem {
  const MenuItem({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.route,
  });

  final String name;
  final double price;
  final String description;
  final String image;
  final String route;
}

const MenuItem vegetablePizza = MenuItem(
  name: 'Vegetable Pizza',
  price: 15.00,
  description: 'Peppers, onions, mushrooms and olives on a rich tomato base.',
  image: 'assets/images/vegetable.jpg',
  route: Routes.vegetable,
);

const MenuItem cheesePizza = MenuItem(
  name: 'Cheese Pizza',
  price: 12.50,
  description: 'Classic mozzarella and cheddar, baked golden and bubbly.',
  image: 'assets/images/cheese.jpg',
  route: Routes.cheese,
);

const MenuItem boxOfFries = MenuItem(
  name: 'Box of Fries',
  price: 6.00,
  description: 'Crispy golden fries, lightly salted and served hot.',
  image: 'assets/images/fries.jpg',
  route: Routes.fries,
);

const List<MenuItem> menuItems = [vegetablePizza, cheesePizza, boxOfFries];

String formatPrice(double price) => 'RM ${price.toStringAsFixed(2)}';

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: Routes.menu,
      routes: {
        Routes.menu: (context) => const MenuScreen(),
        Routes.vegetable: (context) => const DetailScreen(item: vegetablePizza),
        Routes.cheese: (context) => const DetailScreen(item: cheesePizza),
        Routes.fries: (context) => const DetailScreen(item: boxOfFries),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute<void>(builder: (context) => const MenuScreen()),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.local_pizza),
            SizedBox(width: 8),
            Text('Pizza Store'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Our Menu',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          for (final item in menuItems) MenuCard(item: item),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            item.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          formatPrice(item.price),
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
        onTap: () => Navigator.pushNamed(context, item.route),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text(item.name),
      ),
      body: ListView(
        children: [
          Image.asset(
            item.image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formatPrice(item.price),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(item.description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

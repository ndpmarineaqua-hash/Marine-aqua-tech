import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaTechApp());
}

const primary = Color(0xFF0879B8);
const teal = Color(0xFF0FA7A0);
const dark = Color(0xFF073B5C);

class MarineAquaTechApp extends StatelessWidget {
  const MarineAquaTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Tech',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: const Color(0xFFF4FAFC),
      ),
      home: const LoginScreen(),
    );
  }
}

/* ---------------- LOGIN ---------------- */

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.water_drop, size: 70, color: primary),
              const SizedBox(height: 15),
              const Text(
                'MARINE AQUA TECH',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: dark,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Smart Aquaculture. Better Results.'),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixText: '+91 ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AppShell(),
                      ),
                    );
                  },
                  child: const Text('Login / Continue'),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AppShell(),
                    ),
                  );
                },
                child: const Text('Demo Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- APP SHELL ---------------- */

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;

  final pages = const [
    HomeScreen(),
    PondsScreen(),
    ProductsScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_outlined),
            selectedIcon: Icon(Icons.water),
            label: 'Ponds',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/* ---------------- HOME ---------------- */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void open(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Farmer 👋',
                      style: TextStyle(
                        fontSize: 17,
                        color: dark,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Healthy Ponds.\nProfitable Farming.',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none, size: 32),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primary, teal],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STRONGER SHRIMP\nBRIGHTER TOMORROWS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Manage your pond with Marine Aqua Tech.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ActionCard(
                icon: Icons.water,
                title: 'My Ponds',
                onTap: () => open(
                  context,
                  const PondsScreen(),
                ),
              ),
              ActionCard(
                icon: Icons.inventory_2,
                title: 'Products',
                onTap: () => open(
                  context,
                  const ProductsScreen(),
                ),
              ),
              ActionCard(
                icon: Icons.science,
                title: 'Water Test',
                onTap: () => open(
                  context,
                  const WaterTestScreen(),
                ),
              ),
              ActionCard(
                icon: Icons.menu_book,
                title: 'Pond Diary',
                onTap: () => open(
                  context,
                  const PondDiaryScreen(),
                ),
              ),
              ActionCard(
                icon: Icons.support_agent,
                title: 'Support',
                onTap: () => open(
                  context,
                  const SupportScreen(),
                ),
              ),
              ActionCard(
                icon: Icons.location_on,
                title: 'Dealers',
                onTap: () => open(
                  context,
                  const DealersScreen(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "Today's Pond Snapshot",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Expanded(
                child: MetricCard(
                  title: 'pH',
                  value: '7.8',
                  icon: Icons.science,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MetricCard(
                  title: 'DO',
                  value: '5.6 ppm',
                  icon: Icons.bubble_chart,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MetricCard(
                  title: 'Salinity',
                  value: '18 ppt',
                  icon: Icons.waves,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ---------------- ACTION CARD ---------------- */

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: primary,
                size: 35,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- METRIC CARD ---------------- */

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: teal),
            const SizedBox(height: 7),
            Text(title),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- PRODUCTS ---------------- */

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  final products = const [
    ['Marine 6G', 'Liquid Minerals'],
    ['Marine Vibrio Shield', 'Vibrio Control'],
    ['Marine ProTab', 'Probiotic Tablets'],
    ['Marine Volt-X', 'Growth Support'],
    ['Bio Sludge-X', 'Sludge Control'],
    ['OXYTAB+', 'Oxygen Support'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marine Products'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE0F5FA),
                child: Icon(
                  Icons.inventory_2,
                  color: primary,
                ),
              ),
              title: Text(
                product[0],
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Text(product[1]),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      name: product[0],
                      category: product[1],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/* ---------------- PRODUCT DETAILS ---------------- */

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String category;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primary, teal],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: Icon(
                Icons.inventory_2,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            category,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Product Information',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Product description, benefits, dosage, application method, pack size and technical information will be displayed here.',
          ),
          const SizedBox(height: 25),
          const Text(
            'Application',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Follow the product label and technical team recommendations for correct usage.',
          ),
        ],
      ),
    );
  }
}

/* ---------------- PONDS ---------------- */

class PondsScreen extends StatelessWidget {
  const PondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Ponds'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddPondScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          pond(context, 'Pond 1'),
          pond(context, 'Pond 2'),
          pond(context, 'Pond 3'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPondScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Pond'),
      ),
    );
  }

  Widget pond(BuildContext context, String name) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.water),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: const Text(
          '2.5 Acres • Vannamei • Active',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const WaterTestScreen(),
            ),
          );
        },
      ),
    );
  }
}

/* ---------------- ADD POND ---------------- */

class AddPondScreen extends StatelessWidget {
  const AddPondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Pond'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          field('Pond Name', 'Pond 1'),
          field('Pond Size', '2.5 Acres'),
          field('Stocking Date', 'DD/MM/YYYY'),
          field('PL Count', '1,00,000'),
          field('Species', 'Vannamei'),
          field('Water Source', 'Borewell / Canal'),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save Pond'),
          ),
        ],
      ),
    );
  }

  Widget field(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

/* ---------------- WATER TEST ---------------- */

class WaterTestScreen extends StatelessWidget {
  const WaterTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Parameters'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: const [
          MetricCard(
            title: 'pH',
            value: '7.8',
            icon: Icons.science,
          ),
          MetricCard(
            title: 'DO',
            value: '5.6 ppm',
            icon: Icons.bubble_chart,
          ),
          MetricCard(
            title: 'Salinity',
            value: '18 ppt',
            icon: Icons.waves,
          ),
          MetricCard(
            title: 'Temperature',
            value: '29°C',
            icon: Icons.thermostat,
          ),
          MetricCard(
            title: 'Alkalinity',
            value: '120 ppm',
            icon: Icons.account_tree,
          ),
          MetricCard(
            title: 'Ammonia',
            value: '0.02 ppm',
            icon: Icons.science_outlined,
          ),
        ],
      ),
    );
  }
}

/* ---------------- POND DIARY ---------------- */

class PondDiaryScreen extends StatelessWidget

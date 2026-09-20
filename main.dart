import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaTechApp());
}

class MarineAquaTechApp extends StatelessWidget {
  const MarineAquaTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Tech',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
      home: const AppShell(),
    );
  }
}

// ------------------------------------------------------------
// APP SHELL
// ------------------------------------------------------------

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    PondsScreen(),
    ProductsScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
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

// ------------------------------------------------------------
// HOME
// ------------------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marine Aqua Tech',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              openPage(context, const NotificationsScreen());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Hello, Farmer 👋',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Healthy Ponds. Profitable Farming.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 18),

            // Banner
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0077B6),
                    Color(0xFF00A6A6),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STRONGER SHRIMP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'BRIGHTER TOMORROWS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Smart Aquaculture. Better Results.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                ActionCard(
                  icon: Icons.water,
                  title: 'My Ponds',
                  color: Colors.blue,
                  onTap: () {
                    openPage(context, const PondsScreen());
                  },
                ),
                ActionCard(
                  icon: Icons.inventory_2,
                  title: 'Products',
                  color: Colors.teal,
                  onTap: () {
                    openPage(context, const ProductsScreen());
                  },
                ),
                ActionCard(
                  icon: Icons.science,
                  title: 'Water Test',
                  color: Colors.indigo,
                  onTap: () {
                    openPage(context, const WaterTestScreen());
                  },
                ),
                ActionCard(
                  icon: Icons.menu_book,
                  title: 'Pond Diary',
                  color: Colors.orange,
                  onTap: () {
                    openPage(context, const PondDiaryScreen());
                  },
                ),
                ActionCard(
                  icon: Icons.support_agent,
                  title: 'Support',
                  color: Colors.green,
                  onTap: () {
                    openPage(context, const SupportScreen());
                  },
                ),
                ActionCard(
                  icon: Icons.location_on,
                  title: 'Dealers',
                  color: Colors.red,
                  onTap: () {
                    openPage(context, const DealersScreen());
                  },
                ),
              ],
            ),

            const SizedBox(height: 22),

            const Text(
              'Pond Snapshot',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: ParameterCard(
                    title: 'pH',
                    value: '7.8',
                    icon: Icons.science,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ParameterCard(
                    title: 'DO',
                    value: '5.6 ppm',
                    icon: Icons.air,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ParameterCard(
                    title: 'Salinity',
                    value: '18 ppt',
                    icon: Icons.water_drop,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// ACTION CARD
// ------------------------------------------------------------

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 34,
                color: color,
              ),
              const SizedBox(height: 9),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PARAMETER CARD
// ------------------------------------------------------------

class ParameterCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ParameterCard({
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
            Icon(
              icon,
              color: Colors.blue,
              size: 25,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PRODUCTS
// ------------------------------------------------------------

class Product {
  final String name;
  final String category;
  final String description;
  final String dosage;

  const Product({
    required this.name,
    required this.category,
    required this.description,
    required this.dosage,
  });
}

const List<Product> products = [
  Product(
    name: 'Marine ProTab',
    category: 'Probiotic',
    description:
        'Probiotic tablet support for pond water and shrimp health.',
    dosage: '500 g per acre',
  ),
  Product(
    name: 'Marine 6G',
    category: 'Liquid Minerals',
    description:
        'Liquid mineral support for moulting and shell formation.',
    dosage: 'As recommended by technical team',
  ),
  Product(
    name: 'Marine Volt-X',
    category: 'Growth Support',
    description:
        'Feed additive designed to support feed utilisation and growth.',
    dosage: '5 ml per 1 kg feed',
  ),
  Product(
    name: 'Marine Vibrio Shield',
    category: 'Vibrio Control',
    description:
        'Pond management product designed for Vibrio control support.',
    dosage: '1 L per acre',
  ),
  Product(
    name: 'Bio Sludge-X',
    category: 'Sludge Management',
    description:
        'Supports bottom activation and organic waste management.',
    dosage: 'As recommended',
  ),
  Product(
    name: 'OXYTAB+',
    category: 'Oxygen Support',
    description:
        'Oxygen support tablets for aquaculture ponds.',
    dosage: 'As recommended',
  ),
];

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: const Icon(
                  Icons.inventory_2,
                  color: Colors.blue,
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(product.category),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      product: product,
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

// ------------------------------------------------------------
// PRODUCT DETAILS
// ------------------------------------------------------------

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF0077B6),
                  Color(0xFF00A6A6),
                ],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(
              Icons.inventory_2,
              size: 85,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product.category,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.medication,
                color: Colors.blue,
              ),
              title: const Text('Dosage'),
              subtitle: Text(product.dosage),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// PONDS
// ------------------------------------------------------------

class Pond {
  final String name;
  final String location;
  final String area;

  const Pond({
    required this.name,
    required this.location,
    required this.area,
  });
}

class PondsScreen extends StatefulWidget {
  const PondsScreen({super.key});

  @override
  State<PondsScreen> createState() => _PondsScreenState();
}

class _PondsScreenState extends State<PondsScreen> {
  final List<Pond> pondList = [
    const Pond(
      name: 'Pond 1',
      location: 'Kaikaluru',
      area: '2 Acres',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Ponds'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final pond = await Navigator.push<Pond>(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPondScreen(),
            ),
          );

          if (pond != null) {
            setState(() {
              pondList.add(pond);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Pond'),
      ),
      body: pondList.isEmpty
          ? const Center(
              child: Text('No ponds added yet'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: pondList.length,
              itemBuilder: (context, index) {
                final pond = pondList[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.water),
                    ),
                    title: Text(
                      pond.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${pond.location} • ${pond.area}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PondDetailsScreen(
                            pond: pond,
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

// ------------------------------------------------------------
// ADD POND
// ------------------------------------------------------------

class AddPondScreen extends StatefulWidget {
  const AddPondScreen({super.key});

  @override
  State<AddPondScreen> createState() => _AddPondScreenState();
}

class _AddPondScreenState extends State<AddPondScreen> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final areaController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    areaController.dispose();
    super.dispose();
  }

  void savePond() {
    if (nameController.text.trim().isEmpty) {
      return;
    }

    Navigator.pop(
      context,
      Pond(
        name: nameController.text.trim(),
        location: locationController.text.trim().isEmpty
            ? 'Not specified'
            : locationController.text.trim(),
        area: areaController.text.trim().isEmpty
            ? 'Not specified'
       controller: areaController,

import 'package:flutter/material.dart';

void main() => runApp(const MarineAquaTechApp());

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
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: const Color(0xFFF4FAFC),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF006FAE), Color(0xFF0AA6A0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.waves, size: 82, color: Colors.white),
              const SizedBox(height: 18),
              const Text(
                'MARINE\nAQUA TECH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Smart Aquaculture. Better Results.',
                style: TextStyle(
                  color: Colors.white.withOpacity(.9),
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.water_drop, color: primary, size: 58),
              const SizedBox(height: 12),
              const Text('Welcome',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              const Text('Login to continue'),
              const SizedBox(height: 28),
              TextField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+91  ',
                  labelText: 'Mobile number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AppShell()),
                  ),
                  child: const Text('Send OTP'),
                ),
              ),
              const SizedBox(height: 18),
              const Text('or'),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata),
                label: const Text('Continue with Google'),
              ),
              const SizedBox(height: 18),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const AppShell()),
                ),
                child: const Text('Demo Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.water_outlined), selectedIcon: Icon(Icons.water), label: 'Ponds'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.support_agent_outlined), selectedIcon: Icon(Icons.support_agent), label: 'Support'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello, Farmer 👋', style: TextStyle(color: dark)),
                    Text('Healthy Ponds. Profitable Farming.',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [primary, teal]),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STRONGER SHRIMP\nBRIGHTER TOMORROWS',
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('Manage your pond with Marine Aqua Tech.',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: const [
              QuickCard(Icons.water, 'My Ponds'),
              QuickCard(Icons.inventory_2, 'Products'),
              QuickCard(Icons.science, 'Water Test'),
              QuickCard(Icons.menu_book, 'Pond Diary'),
              QuickCard(Icons.support_agent, 'Support'),
              QuickCard(Icons.location_on, 'Dealers'),
            ],
          ),
          const SizedBox(height: 18),
          const SectionTitle('Today’s Pond Snapshot'),
          const SizedBox(height: 10),
          const Row(
            children: [
              MetricCard('pH', '7.8', Icons.science),
              SizedBox(width: 10),
              MetricCard('DO', '5.6 ppm', Icons.bubble_chart),
              SizedBox(width: 10),
              MetricCard('Salinity', '18 ppt', Icons.waves),
            ],
          ),
          const SizedBox(height: 18),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.lightbulb_outline)),
              title: const Text('Today’s Tip'),
              subtitle: const Text('Maintain suitable dissolved oxygen and monitor pond behavior regularly.'),
              trailing: TextButton(onPressed: () {}, child: const Text('View')),
            ),
          ),
        ],
      ),
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String label;
  const QuickCard(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: primary, size: 28),
          const SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    ),
  );
}

class MetricCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  const MetricCard(this.title, this.value, this.icon, {super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: teal),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    ),
  );
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800));
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const products = [
    ['Marine 6G', 'Liquid Minerals', Icons.science],
    ['Vibrio Shield', 'Vibrio Management', Icons.shield],
    ['Marine ProTab', 'Probiotic Tablets', Icons.medication],
    ['Marine Volt-X', 'Growth Support', Icons.trending_up],
    ['Bio Sludge-X', 'Sludge Management', Icons.layers],
    ['OXYTAB+', 'Oxygen Support', Icons.bubble_chart],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Products', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search products...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 14),
          ...products.map((p) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: primary.withOpacity(.1),
                child: Icon(p[2] as IconData, color: primary),
              ),
              title: Text(p[0] as String, style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Text(p[1] as String),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => ProductDetails(name: p[0] as String, subtitle: p[1] as String),
              )),
            ),
          )),
        ],
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final String name, subtitle;
  const ProductDetails({super.key, required this.name, required this.subtitle});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Product Details')),
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          height: 210,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [primary, teal]),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(child: Icon(Icons.inventory_2, color: Colors.white, size: 100)),
        ),
        const SizedBox(height: 18),
        Text(name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 18),
        const SectionTitle('About this product'),
        const SizedBox(height: 8),
        const Text('Product information, usage guidance, application method and technical notes can be maintained here by the Marine Aqua Tech admin team.'),
        const SizedBox(height: 18),
        const SectionTitle('Application'),
        const SizedBox(height: 8),
        const Text('Follow the product label and technical team recommendations for the correct application and dosage.'),
        const SizedBox(height: 22),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.play_circle), label: const Text('Watch Application Video')),
      ],
    ),
  );
}

class PondsScreen extends StatelessWidget {
  const PondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(
            children: [
              const Expanded(child: Text('My Ponds', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900))),
              FilledButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPondScreen())),
                icon: const Icon(Icons.add),
                label: const Text('Add Pond'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...['Pond 1', 'Pond 2', 'Pond 3'].map((name) => Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.water)),
              title: Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: const Text('2.5 Acres • Vannamei • Active'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WaterParametersScreen())),
            ),
          )),
        ],
      ),
    );
  }
}

class AddPondScreen extends StatelessWidget {
  const AddPondScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add New Pond')),
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Field(label: 'Pond Name', hint: 'e.g. Pond 1'),
        const Field(label: 'Pond Size (Acres)', hint: 'e.g. 2.5'),
        const Field(label: 'Stocking Date', hint: 'Select date'),
        const Field(label: 'PL Count', hint: 'e.g. 1,00,000'),
        const Field(label: 'Species', hint: 'Vannamei'),
        const Field(label: 'Water Source', hint: 'Borewell / Canal / Other'),
        const Field(label: 'Remarks', hint: 'Enter remarks'),
        const SizedBox(height: 8),
        FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Save Pond')),
      ],
    ),
  );
}

class Field extends StatelessWidget {
  final String label, hint;
  const Field({super.key, required this.label, required this.hint});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}

class WaterParametersScreen extends StatelessWidget {
  const WaterParametersScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Water Parameters')),
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Row(
          children: [
            Expanded(child: MetricCard('pH', '7.8', Icons.science)),
            Expanded(child: MetricCard('DO', '5.6 ppm', Icons.bubble_chart)),
          ],
        ),
        const Row(
          children: [
            Expanded(child: MetricCard('Salinity', '18 ppt', Icons.waves)),
            Expanded(child: MetricCard('Temp', '29°C', Icons.thermostat)),
          ],
        ),
        const Row(
          children: [
            Expanded(child: MetricCard('Alkalinity', '120 ppm', Icons.account_tree)),
            Expanded(child: MetricCard('Ammonia', '0.02 ppm', Icons.science_outlined)),
          ],
        ),
        const SizedBox(height: 12),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.save), label: const Text('Save Record')),
        TextButton.icon(onPressed: () {}, icon: const Icon(Icons.show_chart), label: const Text('View History')),
      ],
    ),
  );
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('Technical Support', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
        const SizedBox(height: 16),
        SupportTile(Icons.chat, 'Chat with Expert', 'Get instant help from our technical team'),
        SupportTile(Icons.call, 'Call Support', 'Connect with a technical officer'),
        SupportTile(Icons.camera_alt, 'Send Photo / Query', 'Upload pond images and ask a question'),
        SupportTile(Icons.video_call, 'Video Consultation', 'Schedule a video call'),
        SupportTile(Icons.help_outline, 'FAQ', 'Common questions and answers'),
      ],
    ),
  );
}

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const SupportTile(this.icon, this.title, this.subtitle, {super.key});
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
    child: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 42)),
        const SizedBox(height: 10),
        const Center(child: Text('Farmer', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
        const Center(child: Text('+91 XXXXX XXXXX')),
        const SizedBox(height: 20),
        ...[
          ['My Ponds', Icons.water],
          ['My Orders', Icons.shopping_bag],
          ['Notifications', Icons.notifications],
          ['App Settings', Icons.settings],
          ['Help & Support', Icons.help],
          ['About Marine Aqua Tech', Icons.info_outline],
        ].map((x) => Card(
          child: ListTile(
            leading: Icon(x[1] as IconData, color: primary),
            title: Text(x[0] as String),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        )),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Trips247App());

class Trips247App extends StatelessWidget {
  const Trips247App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trips247',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const packages = [
    {'name': 'Dubai 4N/5D', 'price': '₹45,000', 'emoji': '🇦🇪'},
    {'name': 'Thailand 5N/6D', 'price': '₹38,000', 'emoji': '🇹🇭'},
    {'name': 'Bali 5N/6D', 'price': '₹55,000', 'emoji': '🇮🇩'},
    {'name': 'Kashmir 6N/7D', 'price': '₹32,000', 'emoji': '🏔️'},
    {'name': 'Goa 3N/4D', 'price': '₹18,000', 'emoji': '🏖️'},
    {'name': 'Manali 4N/5D', 'price': '₹22,000', 'emoji': '⛰️'},
    {'name': 'Spiti Valley 7N/8D', 'price': '₹42,000', 'emoji': '🏔️'},
    {'name': 'Kedarkantha Trek 5N/6D', 'price': '₹15,000', 'emoji': '🥾'},
    {'name': 'Sundarban 2N/3D', 'price': '₹12,000', 'emoji': '🐯'},
    {'name': 'Tawang 6N/7D', 'price': '₹35,000', 'emoji': '🏔️'},
    {'name': 'Andaman 5N/6D', 'price': '₹48,000', 'emoji': '🏝️'},
    {'name': 'Kerala 6N/7D', 'price': '₹30,000', 'emoji': '🌴'},
  ];

  void _openWhatsApp(String msg) async {
    final uri = Uri.parse('https://wa.me/919546280011?text=${Uri.encodeComponent(msg)}');
    if (await canLaunchUrl(uri)) launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trips247 — Holiday Packages'), backgroundColor: Colors.red),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Card(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Plan Your Dream Holiday', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Best prices • 200+ destinations • 50K+ travellers', style: TextStyle(color: Colors.white70)),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          ...packages.map((p) => Card(
            child: ListTile(
              leading: Text(p['emoji']!, style: const TextStyle(fontSize: 30)),
              title: Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Starting from ${p['price']}'),
              trailing: ElevatedButton(
                onPressed: () => _openWhatsApp('Hi, I want to book ${p['name']} package'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Book', style: TextStyle(color: Colors.white)),
              ),
            ),
          )),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone, color: Colors.red),
              title: const Text('Call Us'),
              subtitle: const Text('+91 95462 80011'),
              trailing: ElevatedButton(
                onPressed: () => launchUrl(Uri.parse('tel:+919546280011')),
                child: const Text('Call'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email, color: Colors.red),
              title: const Text('Email'),
              subtitle: const Text('trips247.in@gmail.com'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openWhatsApp('Hi, I want to enquire about holiday packages'),
        backgroundColor: Colors.green,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
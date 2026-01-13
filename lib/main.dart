import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page Content')),
    const Center(child: Text('Profile Page Content')),
    const Center(child: Text('Settings Page Content')),
  ];

  final List<String> _titles = ['Home', 'Profile', 'Settings'];

  @override
  Widget build(BuildContext context) {
    const double breakpoint = 600;

    return LayoutBuilder(builder: (context, constraints) {
      bool isLargeScreen = constraints.maxWidth >= breakpoint;

      return Scaffold(
        appBar: AppBar(title: Text(_titles[_selectedIndex])),
        drawer: isLargeScreen ? null : Drawer(
          child: AppMenu(
            onItemSelected: (index) {
              setState(() => _selectedIndex = index);
              Navigator.pop(context);
            },
          ),
        ),
        body: Row(
          children: [
            if (isLargeScreen)
              SizedBox(
                width: 250,
                child: AppMenu(
                  onItemSelected: (index) => setState(() => _selectedIndex = index),
                ),
              ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      );
    });
  }
}

class AppMenu extends StatelessWidget {
  final Function(int) onItemSelected;
  const AppMenu({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => onItemSelected(1),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => onItemSelected(2),
          ),
        ],
      ),
    );
  }
}
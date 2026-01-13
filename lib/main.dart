import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive navigation demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const double breakpoint = 600;

  

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) { 
      if (constraints.maxWidth >= breakpoint) {
         return Scaffold(
            appBar: AppBar(title: Text('Large')),
            body: Row(
              children: [
                SizedBox(
                  width: 240,
                  child: AppMenu(),
                ),
                Expanded(
                  child: Center(child: Text('Main Content Area')),
                ),
              ],
            ),
          );
      } else {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Small'),
            ),
            drawer: const Drawer(
              child: AppMenu(),
            ),
            body: const Center(child: Text('Main Content Area')),
          );
      }
    });
  }
}

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // const DrawerHeader(
        //   decoration: BoxDecoration(
        //     color: Colors.blue,
        //   ),
        //   child: Text('Navigation Menu'),
        // ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
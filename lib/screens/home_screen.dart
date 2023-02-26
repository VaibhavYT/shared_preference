import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  bool login = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void printName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? 'vaibhav';
    login = sp.getBool('login') ?? true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache Storage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            login.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setInt('age', 20);
          sp.setString('name', 'Vaibhav Jaiswal');
          sp.setBool('login', false);

          name = sp.getString('name') ?? 'vaibhav';
          login = sp.getBool('login') ?? true;
          print(sp.getInt('age'));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

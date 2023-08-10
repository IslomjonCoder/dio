import 'package:flutter/material.dart';
import 'package:untitled/ui/example1.dart';
import 'package:untitled/ui/example2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio examples'),
      ),
      body: ListView(
        children: [
          ListTile(
              title: const Text('Example 1'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Example1(),
                    ));
              }),
          const Divider(),
          ListTile(
              title: const Text('Example 2'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Example2(),
                    ));
              }),
        ],
      ),
    );
  }
}

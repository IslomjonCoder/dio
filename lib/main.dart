import 'package:flutter/material.dart';
import 'package:untitled/provider/provider_service.dart';
import 'package:untitled/ui/example1.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

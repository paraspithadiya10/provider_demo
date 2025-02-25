import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/contact_list.dart';
import 'package:provider_demo/contact_list_provider.dart';
import 'package:provider_demo/counter_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ContactListProvider())
      ],
      child: MaterialApp(
        home: ContactList(),
      ),
    );
  }
}

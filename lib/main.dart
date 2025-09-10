import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/user_form_screen.dart';
import 'screens/address_list_screen.dart';
import 'screens/user_detail_screen.dart';
import 'providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'screens/user_form_screen.dart';
import 'screens/address_list_screen.dart';
import 'screens/user_detail_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Direcciones de Usuario',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const UserFormScreen(),
        '/addresses': (context) => const AddressListScreen(),
        '/user-detail': (context) => const UserDetailScreen(),
      },
    );
  }
}


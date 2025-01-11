import 'package:flutter/material.dart';
import 'package:laktrade_db_s/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Supabase.initialize(
      url: 
      ,
      anonKey:
      );
  } catch (e) {
    print(e.toString());
    // TODO
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: homePage());
  }
}

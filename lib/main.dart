import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gymaligna/home/homepage.dart';
import 'package:gymaligna/widgets/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://euabudmhifbwupgfpjda.supabase.co',
    anonKey: 'sb_publishable_pOcPGhdVAomSFA-vNhqeIw_wieGoaOy',
  );

  runApp(const GymAlignaApp());
}

class GymAlignaApp extends StatelessWidget {
  const GymAlignaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GymAligna',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB8F34A)),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
    );
  }
}

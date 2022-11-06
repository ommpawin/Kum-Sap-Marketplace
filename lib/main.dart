import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Inti ProviderScope of hooks_riverpod for state management
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


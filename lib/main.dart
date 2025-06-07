import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Wrap the app with ProviderScope
  runApp(const ProviderScope(child: App()));
}

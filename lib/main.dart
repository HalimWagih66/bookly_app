import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'bookly_app.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

var themeApp = LightThemeApp();
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BooklyApp());
}




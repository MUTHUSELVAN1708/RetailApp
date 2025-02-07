import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retail_mobile/presentation/screens/auth/register_screen.dart';
import 'package:retail_mobile/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/theme_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await dotenv.load(fileName: ".env");

  // await Hive.initFlutter();
  // if (!kIsWeb) {
  //   final directory = await getApplicationDocumentsDirectory();
  //   registerHive(directory.path);
  // }
  runApp(const MyApp());
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        routes: {},
        home:  AuthScreen(),
        debugShowCheckedModeBanner: false,
        title: 'Elude Retail',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

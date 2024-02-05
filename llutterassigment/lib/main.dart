import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/UniversityListScreen/Controller/CountryItemController.dart';
import 'Utils/theme/theme_notifier.dart';
import 'appNavigator/app_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => UniversityScreenController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeNotifier appTheme = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: appTheme.lightTheme,
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigator.router,
        onGenerateTitle: (context) {
          return 'Flutter Assignment';
        },
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}

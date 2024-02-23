import 'package:flutter/material.dart';
import 'package:my_docs/providers/search_provider.dart';
import 'package:my_docs/router/app_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Arr Documentation',
        routerConfig: AppRouter,
      ),
    );
  }
}

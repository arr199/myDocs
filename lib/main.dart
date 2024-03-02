import 'package:flutter/material.dart';
import 'package:my_docs/providers/add_document_provider.dart';
import 'package:my_docs/providers/search_provider.dart';
import 'package:my_docs/router/app_router.dart';
import 'package:my_docs/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()) ,
        ChangeNotifierProvider(create: (context) => AddDocumentProvider())
      ],
      child: MaterialApp.router(
        theme: AppTheme(selectedColor: 3).theme(),
        debugShowCheckedModeBanner: false,
        title: 'Arr Documentation',
        routerConfig: AppRouter,
      ),
    );
  }
}

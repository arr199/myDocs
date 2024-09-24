import 'package:flutter/material.dart';
import 'package:my_docs/features/docs/presentation/providers/add_document_provider.dart';
import 'package:my_docs/features/docs/presentation/providers/search_provider.dart';
import 'package:my_docs/core/router/app_router.dart';
import 'package:my_docs/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => AddDocumentProvider())
      ],
      child: MaterialApp.router(
        theme: AppTheme(selectedColor: 3).theme(),
        debugShowCheckedModeBanner: false,
        title: 'Arr Documentation',
        routerConfig: appRouter,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_docs/screens/docDetails/doc_details_screen.dart';
import 'package:my_docs/screens/home/home_screen.dart';

final GoRouter AppRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'document/:id',
            name: "document",
            builder: (BuildContext context, GoRouterState state) {
              return DocumentDetailScreen(
                id: state.pathParameters['id']!,
              );
            }),
      ],
    ),
  ],
);
